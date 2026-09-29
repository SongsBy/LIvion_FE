// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_application_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 판매자 전환 4단계 폼. 화면이 닫히면 입력값도 버린다.
///
/// 확인 요청(사업자·휴대폰·채널명·계좌)은 요청한 값을 기억해 두고, 응답이 오기 전에
/// 사용자가 값을 고쳤으면 그 응답을 버린다. 값을 고치면 확인 결과도 처음으로 돌아간다.

@ProviderFor(SellerApplicationController)
const sellerApplicationControllerProvider =
    SellerApplicationControllerProvider._();

/// 판매자 전환 4단계 폼. 화면이 닫히면 입력값도 버린다.
///
/// 확인 요청(사업자·휴대폰·채널명·계좌)은 요청한 값을 기억해 두고, 응답이 오기 전에
/// 사용자가 값을 고쳤으면 그 응답을 버린다. 값을 고치면 확인 결과도 처음으로 돌아간다.
final class SellerApplicationControllerProvider
    extends
        $NotifierProvider<SellerApplicationController, SellerApplicationState> {
  /// 판매자 전환 4단계 폼. 화면이 닫히면 입력값도 버린다.
  ///
  /// 확인 요청(사업자·휴대폰·채널명·계좌)은 요청한 값을 기억해 두고, 응답이 오기 전에
  /// 사용자가 값을 고쳤으면 그 응답을 버린다. 값을 고치면 확인 결과도 처음으로 돌아간다.
  const SellerApplicationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerApplicationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerApplicationControllerHash();

  @$internal
  @override
  SellerApplicationController create() => SellerApplicationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SellerApplicationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SellerApplicationState>(value),
    );
  }
}

String _$sellerApplicationControllerHash() =>
    r'b91a115fcc4217627c1be9a6371a67761376938f';

/// 판매자 전환 4단계 폼. 화면이 닫히면 입력값도 버린다.
///
/// 확인 요청(사업자·휴대폰·채널명·계좌)은 요청한 값을 기억해 두고, 응답이 오기 전에
/// 사용자가 값을 고쳤으면 그 응답을 버린다. 값을 고치면 확인 결과도 처음으로 돌아간다.

abstract class _$SellerApplicationController
    extends $Notifier<SellerApplicationState> {
  SellerApplicationState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<SellerApplicationState, SellerApplicationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SellerApplicationState, SellerApplicationState>,
              SellerApplicationState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
