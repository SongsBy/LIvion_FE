// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_registration_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 재고 등록 4단계 폼. 화면이 닫히면 입력값도 버린다.

@ProviderFor(InventoryRegistrationController)
const inventoryRegistrationControllerProvider =
    InventoryRegistrationControllerProvider._();

/// 재고 등록 4단계 폼. 화면이 닫히면 입력값도 버린다.
final class InventoryRegistrationControllerProvider
    extends
        $NotifierProvider<
          InventoryRegistrationController,
          InventoryRegistrationState
        > {
  /// 재고 등록 4단계 폼. 화면이 닫히면 입력값도 버린다.
  const InventoryRegistrationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inventoryRegistrationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inventoryRegistrationControllerHash();

  @$internal
  @override
  InventoryRegistrationController create() => InventoryRegistrationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InventoryRegistrationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InventoryRegistrationState>(value),
    );
  }
}

String _$inventoryRegistrationControllerHash() =>
    r'4361ecfbc8763ccdac914718b9b38ce7c5dadf0f';

/// 재고 등록 4단계 폼. 화면이 닫히면 입력값도 버린다.

abstract class _$InventoryRegistrationController
    extends $Notifier<InventoryRegistrationState> {
  InventoryRegistrationState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<InventoryRegistrationState, InventoryRegistrationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                InventoryRegistrationState,
                InventoryRegistrationState
              >,
              InventoryRegistrationState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
