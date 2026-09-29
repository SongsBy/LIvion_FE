import 'package:livion/shared/domain/inspection_grade.dart';

import '../../domain/entities/inventory_listing.dart';
import '../../domain/repositories/inventory_registration_repository.dart';
import '../../domain/usecases/inventory_rules.dart';
import '../demo/inventory_registration_demo_data.dart';

/// 데모 발표용 [InventoryRegistrationRepository]. 어떤 재고든 접수한다.
///
/// 재고 번호는 [clock]의 날짜와 이번 실행에서 받은 순서로 만든다.
final class DemoInventoryRegistrationRepository
    implements InventoryRegistrationRepository {
  DemoInventoryRegistrationRepository({
    this.latency = const Duration(milliseconds: 300),
    this.clock,
  });

  final Duration latency;

  /// 접수일 계산용. null이면 지금 시각.
  final DateTime Function()? clock;

  int _submitted = 0;

  Future<void> _wait() async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
  }

  @override
  Future<InventoryFormOptions> fetchFormOptions() async {
    await _wait();
    return InventoryRegistrationDemoData.options;
  }

  @override
  Future<InventoryListingReceipt> submitListing(
    InventoryListing listing,
  ) async {
    await _wait();
    final today = (clock ?? DateTime.now)();
    _submitted++;
    String two(int v) => v.toString().padLeft(2, '0');
    final date = '${two(today.year % 100)}${two(today.month)}${two(today.day)}';
    return InventoryListingReceipt(
      listingId: 'L-$date-${_submitted.toString().padLeft(4, '0')}',
      estimatedGrade: _estimate(listing, today),
    );
  }

  static InspectionGrade? _estimate(InventoryListing listing, DateTime today) =>
      InspectionGradeRules.estimate(
        daysLeft: daysUntil(listing.expiryDate, today: today),
        appearance: listing.appearance,
        packaging: listing.packaging,
      );
}

/// 데모 사진 고르기. 정면·소비기한 라벨 칸은 예시 사진을 돌려주고,
/// 나머지 칸은 null(촬영 준비 중)이다.
final class DemoInventoryPhotoSource implements InventoryPhotoSource {
  const DemoInventoryPhotoSource();

  @override
  Future<String?> pick(InventoryPhotoSlot slot) async =>
      InventoryRegistrationDemoData.samplePhotos[slot];
}
