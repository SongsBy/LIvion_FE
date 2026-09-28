import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/live_detail.dart';
import 'live_detail_dependencies.dart';
import 'live_detail_selection.dart';

part 'live_detail_controller.g.dart';

/// 실패 시 Riverpod 자동 재시도를 끈다. 재시도는 화면의 "다시 시도"로만 하고,
/// API가 붙으면 dio 재시도 정책과 겹치지 않게 한다.
Duration? _noRetry(int retryCount, Object error) => null;

/// 라이브 방송 화면 조회 상태. [LiveDetailSelection]이 바뀌면 다시 조회한다.
@Riverpod(retry: _noRetry)
class LiveDetailController extends _$LiveDetailController {
  @override
  Future<LiveDetail> build() {
    final liveId = ref.watch(liveDetailSelectionProvider);
    final repository = ref.watch(liveDetailRepositoryProvider);
    return liveId == null
        ? repository.fetchFeaturedLive()
        : repository.fetchLiveDetail(liveId);
  }

  /// 다시 조회. 조회하는 동안 기존 데이터는 유지된다.
  Future<void> refresh() {
    ref.invalidateSelf();
    return future;
  }

  /// 팔로우 토글. 화면에 먼저 반영하고 실패하면 되돌린 뒤 false를 돌려준다.
  Future<bool> toggleFollow() async {
    final current = state;
    if (current.isLoading || !current.hasValue) return false;
    final previous = current.requireValue;
    final following = !previous.seller.isFollowing;

    state = AsyncData(
      previous.copyWith(
        seller: previous.seller.copyWith(isFollowing: following),
      ),
    );
    try {
      await ref
          .read(liveDetailRepositoryProvider)
          .setFollowing(sellerId: previous.seller.id, following: following);
      return true;
    } catch (_) {
      if (ref.mounted) state = AsyncData(previous);
      return false;
    }
  }

  /// 채팅 전송. 보낸 메시지를 목록 끝에 바로 붙이고, 실패하면 그 메시지만 빼고
  /// false를 돌려준다. 보낸 사람 이름은 로그인·실시간 채팅 계약 전이라 "나"로 둔다.
  Future<bool> sendChat(String text) async {
    final message = text.trim();
    final current = state;
    if (message.isEmpty || current.isLoading || !current.hasValue) return false;
    final detail = current.requireValue;
    final now = DateTime.now();
    final local = LiveChatMessage(
      id: 'local-${now.microsecondsSinceEpoch}',
      senderName: localSenderName,
      message: message,
      sentAt: now,
    );

    state = AsyncData(
      detail.copyWith(
        recentChats: [...detail.recentChats, local],
        chatCount: detail.chatCount + 1,
      ),
    );
    try {
      await ref
          .read(liveDetailRepositoryProvider)
          .sendChatMessage(liveId: detail.id, message: message);
      return true;
    } catch (_) {
      if (ref.mounted && state.hasValue) {
        final latest = state.requireValue;
        state = AsyncData(
          latest.copyWith(
            recentChats: latest.recentChats
                .where((m) => m.id != local.id)
                .toList(growable: false),
            chatCount: latest.chatCount - 1,
          ),
        );
      }
      return false;
    }
  }

  /// 내가 보낸 채팅의 표시 이름. 사용자 계정이 붙으면 그 닉네임으로 바꾼다.
  static const String localSenderName = '나';
}
