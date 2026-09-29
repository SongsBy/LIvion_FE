import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/features/seller_channel/data/repositories/demo_seller_channel_repository.dart';
import 'package:livion/features/seller_channel/domain/entities/seller_channel.dart';
import 'package:livion/features/seller_channel/domain/repositories/seller_channel_repository.dart';
import 'package:livion/features/seller_channel/presentation/providers/post_comments_controller.dart';
import 'package:livion/features/seller_channel/presentation/providers/seller_channel_controller.dart';
import 'package:livion/features/seller_channel/presentation/providers/seller_channel_dependencies.dart';

final _now = DateTime(2026, 9, 29, 21);

/// 데모 저장소를 쓰되 팔로우·좋아요·댓글 요청을 실패시킬 수 있다.
class _FlakyRepository implements SellerChannelRepository {
  final _demo = DemoSellerChannelRepository(
    latency: Duration.zero,
    clock: () => _now,
  );
  bool fail = false;

  void _maybeFail() {
    if (fail) throw Exception('network');
  }

  @override
  Future<SellerChannel> fetchChannel(String sellerId) =>
      _demo.fetchChannel(sellerId);

  @override
  Future<int> setFollowing(String sellerId, {required bool following}) async {
    _maybeFail();
    return _demo.setFollowing(sellerId, following: following);
  }

  @override
  Future<int> setPostLiked(String postId, {required bool liked}) async {
    _maybeFail();
    return _demo.setPostLiked(postId, liked: liked);
  }

  @override
  Future<List<PostComment>> fetchComments(String postId) =>
      _demo.fetchComments(postId);

  @override
  Future<PostComment> addComment(String postId, String message) async {
    _maybeFail();
    return _demo.addComment(postId, message);
  }
}

ProviderContainer _container(_FlakyRepository repository) {
  final container = ProviderContainer(
    overrides: [
      sellerChannelRepositoryProvider.overrideWithValue(repository),
      sellerChannelClockProvider.overrideWithValue(() => _now),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

const _seller = 'store-hanbit';

Future<SellerChannel> _load(ProviderContainer c) {
  c.listen(sellerChannelControllerProvider(_seller), (_, _) {});
  return c.read(sellerChannelControllerProvider(_seller).future);
}

void main() {
  test('Figma 판매자 페이지 내용을 불러온다', () async {
    final channel = await _load(_container(_FlakyRepository()));
    expect(channel.name, '한빛식품');
    expect(channel.followerCount, 1435);
    expect(channel.liveNow?.bidCount, 14);
    expect(channel.posts, hasLength(3));
    expect(channel.lives.first.id, channel.liveNow?.liveId);
    expect(channel.notices.map((n) => n.title), contains('A/S 안내'));
  });

  test('팔로우는 바로 반영되고 서버 수로 맞춰진다', () async {
    final c = _container(_FlakyRepository());
    await _load(c);
    final ok = await c
        .read(sellerChannelControllerProvider(_seller).notifier)
        .toggleFollow();
    final channel = c.read(sellerChannelControllerProvider(_seller)).value!;
    expect(ok, isTrue);
    expect(channel.isFollowing, isTrue);
    expect(channel.followerCount, 1436);
  });

  test('팔로우 요청이 실패하면 되돌린다', () async {
    final repository = _FlakyRepository()..fail = true;
    final c = _container(repository);
    await _load(c);
    final ok = await c
        .read(sellerChannelControllerProvider(_seller).notifier)
        .toggleFollow();
    final channel = c.read(sellerChannelControllerProvider(_seller)).value!;
    expect(ok, isFalse);
    expect(channel.isFollowing, isFalse);
    expect(channel.followerCount, 1435);
  });

  test('좋아요를 켜고 끈다, 실패하면 되돌린다', () async {
    final repository = _FlakyRepository();
    final c = _container(repository);
    final postId = (await _load(c)).posts.first.id;
    final notifier = c.read(sellerChannelControllerProvider(_seller).notifier);
    SellerPost post() =>
        c.read(sellerChannelControllerProvider(_seller)).value!.posts.first;

    expect(await notifier.toggleLike(postId), isTrue);
    expect((post().isLiked, post().likeCount), (true, 1));

    repository.fail = true;
    expect(await notifier.toggleLike(postId), isFalse);
    expect((post().isLiked, post().likeCount), (true, 1));
  });

  test('댓글을 남기면 목록 끝에 붙고 댓글 수를 돌려준다', () async {
    final c = _container(_FlakyRepository());
    const postId = 'post-vegetables';
    final provider = postCommentsControllerProvider(postId);
    c.listen(provider, (_, _) {});
    final before = (await c.read(provider.future)).comments.length;

    final count = await c.read(provider.notifier).send('  맛있어요  ');
    final comments = c.read(provider).value!.comments;
    expect(count, before + 1);
    expect(comments.last.message, '맛있어요');
    expect(comments.last.isSeller, isTrue);

    expect(await c.read(provider.notifier).send('   '), isNull);
  });

  test('댓글 요청이 실패하면 입력 전 목록을 그대로 둔다', () async {
    final repository = _FlakyRepository();
    final c = _container(repository);
    final provider = postCommentsControllerProvider('post-vegetables');
    c.listen(provider, (_, _) {});
    final before = await c.read(provider.future);

    repository.fail = true;
    expect(await c.read(provider.notifier).send('안녕하세요'), isNull);
    expect(c.read(provider).value, before);
  });
}
