import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_profile.freezed.dart';

/// 한 사용자가 오갈 수 있는 계정 종류.
enum AccountRole { buyer, seller }

/// 전환할 수 있는 계정 하나 (구매자 본인 또는 판매자 상점).
@freezed
abstract class AccountProfile with _$AccountProfile {
  const factory AccountProfile({
    required String id,
    required String name,

    /// 에셋 경로 또는 URL. null이면 빈 아바타 실루엣.
    String? avatar,
    required AccountRole role,
  }) = _AccountProfile;
}

/// 로그인한 사용자의 계정 목록과 지금 쓰는 계정.
@freezed
abstract class AccountSession with _$AccountSession {
  const AccountSession._();

  const factory AccountSession({
    required List<AccountProfile> profiles,
    required String activeProfileId,
  }) = _AccountSession;

  /// 판매자 계정이 있는지. 없으면 계정 전환 시트에 판매자 전환 안내가 보인다.
  bool get hasSeller => profiles.any((p) => p.role == AccountRole.seller);

  /// 지금 쓰는 계정. id가 목록에 없으면 첫 계정.
  AccountProfile get active => profiles.firstWhere(
    (p) => p.id == activeProfileId,
    orElse: () => profiles.first,
  );
}
