import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_summary.dart';
import '../providers/home_feed_controller.dart';
import '../widgets/home_feed_view.dart';

/// 앱 진입 첫 화면. 상단 바·하단 내비는 루트 탭이 그린다.
///
/// 조회 상태(loading / error / data)만 나누고 실제 레이아웃은 [HomeFeedView]가 맡는다.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, this.onOpenLive});

  /// 라이브 카드·히어로를 눌렀을 때. 상품 라이브 화면이 붙으면 그 화면으로 잇는다.
  final ValueChanged<LiveSummary>? onOpenLive;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feed = ref.watch(homeFeedControllerProvider);
    return feed.when(
      loading: () => const AppLoadingView(),
      error: (_, _) => AppErrorView(
        message: '홈 정보를 불러오지 못했어요.\n잠시 후 다시 시도해 주세요.',
        onRetry: () => ref.invalidate(homeFeedControllerProvider),
      ),
      data: (data) => HomeFeedView(
        feed: data,
        onRefresh: () =>
            ref.read(homeFeedControllerProvider.notifier).refresh(),
        onLiveTap: onOpenLive,
      ),
    );
  }
}
