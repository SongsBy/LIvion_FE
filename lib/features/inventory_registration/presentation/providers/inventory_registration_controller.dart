import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:livion/shared/domain/inspection_grade.dart';

import '../../domain/entities/inventory_listing.dart';
import '../../domain/repositories/inventory_registration_repository.dart';
import '../../domain/usecases/inventory_rules.dart';
import 'inventory_registration_dependencies.dart';

part 'inventory_registration_controller.freezed.dart';
part 'inventory_registration_controller.g.dart';

/// 재고 등록 단계 (Figma 14_RegisterBasic ~ 17_RegisterReview).
enum InventoryRegistrationStep { basic, condition, pricing, review }

/// 최저 낙찰 허용가 설정 방식.
enum MinimumPriceMode { none, custom }

/// 다음 단계로 넘어가기 전에 채워야 하는 항목. 화면이 안내 문구로 바꾼다.
enum InventoryRegistrationIssue {
  photosMissing,
  productNameMissing,
  categoryMissing,
  sizeMissing,
  supplyQuantityMissing,
  expiryMissing,
  storageMissing,
  stockTypeMissing,
  appearanceMissing,
  packagingMissing,
  startPriceMissing,
  bidIncrementMissing,
  minimumPriceMissing,
  consentMissing,
}

/// 재고 등록 폼 전체 상태. 단계를 오가도 입력값을 그대로 둔다.
///
/// 수량·금액은 입력창 그대로 숫자 문자열로 두고 신청할 때 정수로 바꾼다.
@freezed
abstract class InventoryRegistrationState with _$InventoryRegistrationState {
  const InventoryRegistrationState._();

  const factory InventoryRegistrationState({
    @Default(InventoryRegistrationStep.basic) InventoryRegistrationStep step,

    // ── 1 기본 정보 ──
    @Default(<InventoryPhotoSlot, String>{})
    Map<InventoryPhotoSlot, String> photos,
    @Default('') String productName,
    String? category,
    @Default('') String size,
    @Default('') String supplyQuantity,
    String? brand,

    // ── 2 상태·검수 ──
    DateTime? expiryDate,
    StorageCondition? storage,
    InventoryStockType? stockType,
    @Default(<AppearanceCondition>{}) Set<AppearanceCondition> appearance,
    PackagingCondition? packaging,

    // ── 3 방송·가격 ──
    @Default(BroadcastChannel.official) BroadcastChannel channel,
    BroadcastWeekday? slotWeekday,
    int? slotHour,
    @Default('') String startPrice,
    int? bidIncrement,
    @Default(MinimumPriceMode.none) MinimumPriceMode minimumPriceMode,
    @Default('') String minimumPrice,

    // ── 4 검토 ──
    @Default(false) bool consentConfirmed,

    /// 신청 요청 중. 성공하면 화면이 닫힐 때까지 true로 둔다.
    @Default(false) bool isSubmitting,
  }) = _InventoryRegistrationState;

  bool get isFirstStep => step == InventoryRegistrationStep.values.first;
  bool get isLastStep => step == InventoryRegistrationStep.values.last;

  /// 요일과 시각을 모두 골랐을 때만 슬롯이 된다.
  BroadcastSlot? get slot => slotWeekday == null || slotHour == null
      ? null
      : BroadcastSlot(weekday: slotWeekday!, hour: slotHour!);

  BroadcastSlotKind? get slotKind {
    final s = slot;
    return s == null ? null : BroadcastSlotRules.kindOf(s);
  }

  int? get supplyQuantityValue => _positive(supplyQuantity);
  int? get startPriceValue => _positive(startPrice);
  int? get minimumPriceValue => minimumPriceMode == MinimumPriceMode.custom
      ? _positive(minimumPrice)
      : null;

  /// 소비기한까지 남은 날. 아직 고르지 않았으면 null.
  int? daysLeft(DateTime today) =>
      expiryDate == null ? null : daysUntil(expiryDate!, today: today);

  /// 지금 고른 값으로 본 예상 검수 등급. 기준이 다 정해지지 않았으면 null.
  InspectionGrade? estimatedGrade(DateTime today) =>
      InspectionGradeRules.estimate(
        daysLeft: daysLeft(today),
        appearance: appearance,
        packaging: packaging,
      );

  /// [target] 단계에서 아직 채우지 않은 첫 항목. 다 채웠으면 null.
  InventoryRegistrationIssue? issueIn(InventoryRegistrationStep target) =>
      switch (target) {
        InventoryRegistrationStep.basic => _basicIssue,
        InventoryRegistrationStep.condition => _conditionIssue,
        InventoryRegistrationStep.pricing => _pricingIssue,
        InventoryRegistrationStep.review =>
          consentConfirmed ? null : InventoryRegistrationIssue.consentMissing,
      };

  InventoryRegistrationIssue? get _basicIssue {
    final hasRequiredPhotos = InventoryPhotoSlot.values
        .where((s) => s.isRequired)
        .every(photos.containsKey);
    if (!hasRequiredPhotos) return InventoryRegistrationIssue.photosMissing;
    if (productName.trim().isEmpty) {
      return InventoryRegistrationIssue.productNameMissing;
    }
    if (category == null) return InventoryRegistrationIssue.categoryMissing;
    if (size.trim().isEmpty) return InventoryRegistrationIssue.sizeMissing;
    if (supplyQuantityValue == null) {
      return InventoryRegistrationIssue.supplyQuantityMissing;
    }
    return null;
  }

  InventoryRegistrationIssue? get _conditionIssue {
    if (expiryDate == null) return InventoryRegistrationIssue.expiryMissing;
    if (storage == null) return InventoryRegistrationIssue.storageMissing;
    if (stockType == null) return InventoryRegistrationIssue.stockTypeMissing;
    if (appearance.isEmpty) return InventoryRegistrationIssue.appearanceMissing;
    if (packaging == null) return InventoryRegistrationIssue.packagingMissing;
    return null;
  }

  InventoryRegistrationIssue? get _pricingIssue {
    if (startPriceValue == null) {
      return InventoryRegistrationIssue.startPriceMissing;
    }
    if (bidIncrement == null) {
      return InventoryRegistrationIssue.bidIncrementMissing;
    }
    if (minimumPriceMode == MinimumPriceMode.custom &&
        minimumPriceValue == null) {
      return InventoryRegistrationIssue.minimumPriceMissing;
    }
    return null;
  }

  /// 모든 단계를 채웠으면 신청할 재고, 아니면 null.
  InventoryListing? toListing() {
    for (final s in InventoryRegistrationStep.values) {
      if (issueIn(s) != null) return null;
    }
    return _listing(today: expiryDate!);
  }

  /// 빈 칸이 있어도 만드는 재고. 고르지 않은 항목은 첫 선택지로, 소비기한은 [today]로 채운다.
  ///
  /// 필수 항목 검사를 끈 데모에서만 쓴다 ([InventoryRegistrationController.submit]).
  InventoryListing toDraftListing({required DateTime today}) =>
      _listing(today: today);

  InventoryListing _listing({required DateTime today}) => InventoryListing(
    photos: photos,
    productName: productName.trim(),
    category: category ?? '',
    size: size.trim(),
    supplyQuantity: supplyQuantityValue ?? 0,
    brand: brand,
    expiryDate: expiryDate ?? today,
    storage: storage ?? StorageCondition.values.first,
    stockType: stockType ?? InventoryStockType.values.first,
    appearance: appearance,
    packaging: packaging ?? PackagingCondition.values.first,
    channel: channel,
    slot: slot,
    startPrice: startPriceValue ?? 0,
    bidIncrement: bidIncrement ?? 0,
    minimumWinningPrice: minimumPriceValue,
  );

  static int? _positive(String digits) {
    final value = int.tryParse(digits);
    return value == null || value <= 0 ? null : value;
  }
}

/// 재고 등록 4단계 폼. 화면이 닫히면 입력값도 버린다.
@riverpod
class InventoryRegistrationController
    extends _$InventoryRegistrationController {
  late InventoryRegistrationRepository _repository;
  late DateTime Function() _now;
  late bool _requiresInput;

  @override
  InventoryRegistrationState build() {
    _repository = ref.watch(inventoryRegistrationRepositoryProvider);
    _now = ref.watch(inventoryRegistrationClockProvider);
    _requiresInput = ref.watch(inventoryRegistrationRequiresInputProvider);
    return const InventoryRegistrationState();
  }

  // ── 단계 이동 ─────────────────────────────────────────────────

  /// 다음 단계로 넘어간다. 마지막 단계에서는 넘어가지 않는다.
  ///
  /// 필수 항목 검사가 켜져 있으면 빠진 항목이 있을 때 넘어가지 않고 그 항목을
  /// 돌려준다. 마지막 확인 체크는 검사 설정과 상관없이 확인한다.
  InventoryRegistrationIssue? next() {
    final issue = _requiresInput || state.isLastStep
        ? state.issueIn(state.step)
        : null;
    if (issue != null || state.isLastStep || state.isSubmitting) return issue;
    state = state.copyWith(
      step: InventoryRegistrationStep.values[state.step.index + 1],
    );
    return null;
  }

  /// 이전 단계로 돌아간다. 첫 단계이거나 신청 중이면 false (화면이 닫을지 정한다).
  bool back() {
    if (state.isFirstStep || state.isSubmitting) return false;
    state = state.copyWith(
      step: InventoryRegistrationStep.values[state.step.index - 1],
    );
    return true;
  }

  /// 검토 화면의 "수정"으로 그 단계로 돌아간다.
  void goTo(InventoryRegistrationStep step) {
    if (state.isSubmitting) return;
    state = state.copyWith(step: step);
  }

  // ── 1 기본 정보 ──────────────────────────────────────────────

  void attachPhoto(InventoryPhotoSlot slot, String path) =>
      state = state.copyWith(photos: {...state.photos, slot: path});

  void removePhoto(InventoryPhotoSlot slot) =>
      state = state.copyWith(photos: {...state.photos}..remove(slot));

  void setProductName(String value) =>
      state = state.copyWith(productName: value);

  void selectCategory(String value) => state = state.copyWith(category: value);

  void setSize(String value) => state = state.copyWith(size: value);

  void setSupplyQuantity(String value) =>
      state = state.copyWith(supplyQuantity: value);

  void selectBrand(String value) => state = state.copyWith(brand: value);

  // ── 2 상태·검수 ──────────────────────────────────────────────

  void setExpiryDate(DateTime value) =>
      state = state.copyWith(expiryDate: value);

  void selectStorage(StorageCondition value) =>
      state = state.copyWith(storage: value);

  void selectStockType(InventoryStockType value) =>
      state = state.copyWith(stockType: value);

  void toggleAppearance(AppearanceCondition value) => state = state.copyWith(
    appearance: toggledAppearance(state.appearance, value),
  );

  void selectPackaging(PackagingCondition value) =>
      state = state.copyWith(packaging: value);

  // ── 3 방송·가격 ──────────────────────────────────────────────

  void selectChannel(BroadcastChannel value) =>
      state = state.copyWith(channel: value);

  void selectSlotWeekday(BroadcastWeekday value) =>
      state = state.copyWith(slotWeekday: value);

  void selectSlotHour(int value) => state = state.copyWith(slotHour: value);

  void setStartPrice(String value) => state = state.copyWith(startPrice: value);

  void selectBidIncrement(int value) =>
      state = state.copyWith(bidIncrement: value);

  void setMinimumPriceMode(MinimumPriceMode value) =>
      state = state.copyWith(minimumPriceMode: value);

  void setMinimumPrice(String value) =>
      state = state.copyWith(minimumPrice: value);

  // ── 4 검토 ───────────────────────────────────────────────────

  void setConsent({required bool confirmed}) =>
      state = state.copyWith(consentConfirmed: confirmed);

  /// 검수를 요청하고 편성을 신청한다. 성공하면 접수 결과, 실패하면 null.
  ///
  /// 필수 항목 검사를 끈 데모에서는 빈 칸이 있어도 [InventoryRegistrationState.toDraftListing]
  /// 으로 신청한다. 확인 체크를 하지 않았으면 신청하지 않는다.
  Future<InventoryListingReceipt?> submit() async {
    if (state.isSubmitting || !state.consentConfirmed) return null;
    final listing = _requiresInput
        ? state.toListing()
        : state.toListing() ?? state.toDraftListing(today: _now());
    if (listing == null) return null;

    state = state.copyWith(isSubmitting: true);
    try {
      return await _repository.submitListing(listing);
    } catch (_) {
      if (ref.mounted) state = state.copyWith(isSubmitting: false);
      return null;
    }
  }
}
