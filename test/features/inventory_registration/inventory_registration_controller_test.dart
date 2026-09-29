import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/features/inventory_registration/data/demo/inventory_registration_demo_data.dart';
import 'package:livion/features/inventory_registration/domain/entities/inventory_listing.dart';
import 'package:livion/features/inventory_registration/domain/repositories/inventory_registration_repository.dart';
import 'package:livion/features/inventory_registration/presentation/providers/inventory_registration_controller.dart';
import 'package:livion/features/inventory_registration/presentation/providers/inventory_registration_dependencies.dart';
import 'package:livion/shared/domain/inspection_grade.dart';

class _FakeRepository implements InventoryRegistrationRepository {
  bool failSubmit = false;
  final submitted = <InventoryListing>[];

  @override
  Future<InventoryFormOptions> fetchFormOptions() async =>
      InventoryRegistrationDemoData.options;

  @override
  Future<InventoryListingReceipt> submitListing(
    InventoryListing listing,
  ) async {
    if (failSubmit) throw Exception('network');
    submitted.add(listing);
    return const InventoryListingReceipt(listingId: 'L-260914-0001');
  }
}

final _today = DateTime(2026, 9, 14);

ProviderContainer _container(
  _FakeRepository repository, {
  bool requiresInput = false,
}) {
  final container = ProviderContainer(
    overrides: [
      inventoryRegistrationRepositoryProvider.overrideWithValue(repository),
      inventoryRegistrationClockProvider.overrideWithValue(() => _today),
      inventoryRegistrationRequiresInputProvider.overrideWithValue(
        requiresInput,
      ),
    ],
  );
  addTearDown(container.dispose);
  // autoDispose provider가 테스트 중에 버려지지 않게 붙잡아 둔다.
  container.listen(inventoryRegistrationControllerProvider, (_, _) {});
  return container;
}

/// Figma 예시대로 네 단계를 모두 채운다.
void _fillAll(InventoryRegistrationController c) {
  c
    ..attachPhoto(InventoryPhotoSlot.front, 'front.jpg')
    ..attachPhoto(InventoryPhotoSlot.expiryLabel, 'label.jpg')
    ..setProductName('냉동만두 1.2kg')
    ..selectCategory('임박식품 > 냉동')
    ..setSize('1.2kg')
    ..setSupplyQuantity('120')
    ..setExpiryDate(DateTime(2026, 9, 26))
    ..selectStorage(StorageCondition.frozen)
    ..selectStockType(InventoryStockType.imminent)
    ..toggleAppearance(AppearanceCondition.intact)
    ..selectPackaging(PackagingCondition.sealed)
    ..selectSlotWeekday(BroadcastWeekday.tue)
    ..selectSlotHour(20)
    ..setStartPrice('3000')
    ..selectBidIncrement(500);
}

void main() {
  test('검사를 끈 기본 설정은 빈 칸이 있어도 다음 단계로 넘어간다', () {
    final container = _container(_FakeRepository());
    final c = container.read(inventoryRegistrationControllerProvider.notifier);

    expect(c.next(), isNull);
    expect(c.next(), isNull);
    expect(c.next(), isNull);
    expect(
      container.read(inventoryRegistrationControllerProvider).step,
      InventoryRegistrationStep.review,
    );
    // 마지막 확인은 검사 설정과 상관없이 해야 한다.
    expect(c.next(), InventoryRegistrationIssue.consentMissing);
  });

  test('검사를 켜면 빠진 첫 항목을 돌려주고 넘어가지 않는다', () {
    final container = _container(_FakeRepository(), requiresInput: true);
    final c = container.read(inventoryRegistrationControllerProvider.notifier);

    expect(c.next(), InventoryRegistrationIssue.photosMissing);
    c
      ..attachPhoto(InventoryPhotoSlot.front, 'front.jpg')
      ..attachPhoto(InventoryPhotoSlot.expiryLabel, 'label.jpg');
    expect(c.next(), InventoryRegistrationIssue.productNameMissing);
    expect(
      container.read(inventoryRegistrationControllerProvider).step,
      InventoryRegistrationStep.basic,
    );
  });

  test('직접 작성을 고르면 최저 낙찰 허용가가 필요하다', () {
    final container = _container(_FakeRepository());
    final c = container.read(inventoryRegistrationControllerProvider.notifier);
    _fillAll(c);
    c.setMinimumPriceMode(MinimumPriceMode.custom);
    final state = container.read(inventoryRegistrationControllerProvider);
    expect(
      state.issueIn(InventoryRegistrationStep.pricing),
      InventoryRegistrationIssue.minimumPriceMissing,
    );
    c.setMinimumPrice('5000');
    expect(
      container
          .read(inventoryRegistrationControllerProvider)
          .issueIn(InventoryRegistrationStep.pricing),
      isNull,
    );
  });

  test('예상 등급·슬롯은 고른 값에서 나온다', () {
    final container = _container(_FakeRepository());
    final c = container.read(inventoryRegistrationControllerProvider.notifier);
    _fillAll(c);
    final state = container.read(inventoryRegistrationControllerProvider);
    expect(state.daysLeft(_today), 12);
    expect(state.estimatedGrade(_today), InspectionGrade.b);
    expect(state.slotKind, BroadcastSlotKind.regular);
  });

  test('사진을 빼면 그 칸만 비운다', () {
    final container = _container(_FakeRepository());
    final c = container.read(inventoryRegistrationControllerProvider.notifier);
    c
      ..attachPhoto(InventoryPhotoSlot.front, 'front.jpg')
      ..attachPhoto(InventoryPhotoSlot.expiryLabel, 'label.jpg')
      ..removePhoto(InventoryPhotoSlot.front);
    expect(container.read(inventoryRegistrationControllerProvider).photos, {
      InventoryPhotoSlot.expiryLabel: 'label.jpg',
    });
  });

  test('수정은 그 단계로 돌아가고, 첫 단계에서 back은 false', () {
    final container = _container(_FakeRepository());
    final c = container.read(inventoryRegistrationControllerProvider.notifier);
    expect(c.back(), isFalse);
    c
      ..next()
      ..next()
      ..next()
      ..goTo(InventoryRegistrationStep.condition);
    expect(
      container.read(inventoryRegistrationControllerProvider).step,
      InventoryRegistrationStep.condition,
    );
    expect(c.back(), isTrue);
  });

  test('확인하지 않으면 신청하지 않는다', () async {
    final repository = _FakeRepository();
    final container = _container(repository);
    final c = container.read(inventoryRegistrationControllerProvider.notifier);
    _fillAll(c);
    expect(await c.submit(), isNull);
    expect(repository.submitted, isEmpty);
  });

  test('다 채우고 확인하면 입력대로 신청한다', () async {
    final repository = _FakeRepository();
    final container = _container(repository, requiresInput: true);
    final c = container.read(inventoryRegistrationControllerProvider.notifier);
    _fillAll(c);
    c.setConsent(confirmed: true);

    final receipt = await c.submit();
    expect(receipt?.listingId, 'L-260914-0001');
    final listing = repository.submitted.single;
    expect(listing.supplyQuantity, 120);
    expect(listing.startPrice, 3000);
    expect(listing.bidIncrement, 500);
    expect(
      listing.slot,
      const BroadcastSlot(weekday: BroadcastWeekday.tue, hour: 20),
    );
    expect(listing.minimumWinningPrice, isNull);
    expect(
      container.read(inventoryRegistrationControllerProvider).isSubmitting,
      isTrue,
    );
  });

  test('검사를 끈 데모는 빈 폼도 초안으로 신청한다', () async {
    final repository = _FakeRepository();
    final container = _container(repository);
    final c = container.read(inventoryRegistrationControllerProvider.notifier);
    c.setConsent(confirmed: true);

    expect(await c.submit(), isNotNull);
    final listing = repository.submitted.single;
    expect(listing.expiryDate, _today);
    expect(listing.storage, StorageCondition.values.first);
  });

  test('신청이 실패하면 다시 누를 수 있게 돌아온다', () async {
    final repository = _FakeRepository()..failSubmit = true;
    final container = _container(repository);
    final c = container.read(inventoryRegistrationControllerProvider.notifier);
    _fillAll(c);
    c.setConsent(confirmed: true);

    expect(await c.submit(), isNull);
    expect(
      container.read(inventoryRegistrationControllerProvider).isSubmitting,
      isFalse,
    );
  });
}
