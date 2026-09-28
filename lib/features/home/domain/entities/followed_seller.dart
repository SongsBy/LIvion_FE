import 'package:freezed_annotation/freezed_annotation.dart';

part 'followed_seller.freezed.dart';

/// 팔로우한 판매자. [isLive]면 오렌지 링과 LIVE 뱃지가 붙는다.
@freezed
abstract class FollowedSeller with _$FollowedSeller {
  const factory FollowedSeller({
    required String id,
    required String name,
    String? avatar,
    @Default(false) bool isLive,
  }) = _FollowedSeller;
}
