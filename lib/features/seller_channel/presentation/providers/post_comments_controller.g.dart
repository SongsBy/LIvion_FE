// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comments_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 게시글 하나의 댓글. 시트를 닫으면 버린다.

@ProviderFor(PostCommentsController)
const postCommentsControllerProvider = PostCommentsControllerFamily._();

/// 게시글 하나의 댓글. 시트를 닫으면 버린다.
final class PostCommentsControllerProvider
    extends $AsyncNotifierProvider<PostCommentsController, PostCommentsState> {
  /// 게시글 하나의 댓글. 시트를 닫으면 버린다.
  const PostCommentsControllerProvider._({
    required PostCommentsControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: _noRetry,
         name: r'postCommentsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$postCommentsControllerHash();

  @override
  String toString() {
    return r'postCommentsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PostCommentsController create() => PostCommentsController();

  @override
  bool operator ==(Object other) {
    return other is PostCommentsControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postCommentsControllerHash() =>
    r'6f6b53122641c9a2bbb93eca0c39f0d172c3875a';

/// 게시글 하나의 댓글. 시트를 닫으면 버린다.

final class PostCommentsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          PostCommentsController,
          AsyncValue<PostCommentsState>,
          PostCommentsState,
          FutureOr<PostCommentsState>,
          String
        > {
  const PostCommentsControllerFamily._()
    : super(
        retry: _noRetry,
        name: r'postCommentsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 게시글 하나의 댓글. 시트를 닫으면 버린다.

  PostCommentsControllerProvider call(String postId) =>
      PostCommentsControllerProvider._(argument: postId, from: this);

  @override
  String toString() => r'postCommentsControllerProvider';
}

/// 게시글 하나의 댓글. 시트를 닫으면 버린다.

abstract class _$PostCommentsController
    extends $AsyncNotifier<PostCommentsState> {
  late final _$args = ref.$arg as String;
  String get postId => _$args;

  FutureOr<PostCommentsState> build(String postId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<PostCommentsState>, PostCommentsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PostCommentsState>, PostCommentsState>,
              AsyncValue<PostCommentsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
