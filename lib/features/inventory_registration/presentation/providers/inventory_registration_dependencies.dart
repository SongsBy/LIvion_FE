import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/demo_inventory_registration_repository.dart';
import '../../domain/entities/inventory_listing.dart';
import '../../domain/repositories/inventory_registration_repository.dart';

part 'inventory_registration_dependencies.g.dart';

/// 재고 등록 feature 의존성 조립. data 구현은 여기서만 import한다.
///
/// API가 준비되면 데모 구현을 remote 구현으로 바꾼다. 재고 번호 순서를 이어 가도록
/// 앱이 떠 있는 동안 하나만 둔다.
@Riverpod(keepAlive: true)
InventoryRegistrationRepository inventoryRegistrationRepository(Ref ref) =>
    DemoInventoryRegistrationRepository(
      clock: ref.watch(inventoryRegistrationClockProvider),
    );

/// 사진 찍기·고르기. 데모는 정면·소비기한 라벨 칸만 예시 사진을 준다.
@riverpod
InventoryPhotoSource inventoryPhotoSource(Ref ref) =>
    const DemoInventoryPhotoSource();

/// 소비기한 D-day·재고 번호 날짜 계산용 시계. 테스트에서 고정 시각으로 바꾼다.
@Riverpod(keepAlive: true)
DateTime Function() inventoryRegistrationClock(Ref ref) => DateTime.now;

/// 재고 등록 폼의 필수 항목 검사 여부.
///
/// 판매자 전환 폼과 같이 데모 발표 동안은 꺼 두어 빈 칸이 있어도 "다음"으로 넘어간다.
/// true로 바꾸면 빠진 항목이 있을 때 넘어가지 않고 안내한다. 마지막 확인 체크는
/// 이 값과 상관없이 해야 신청 버튼이 켜진다.
@riverpod
bool inventoryRegistrationRequiresInput(Ref ref) => false;

/// 실패 시 Riverpod 자동 재시도를 끈다. 다시 시도는 화면 버튼으로만 한다.
Duration? _noRetry(int retryCount, Object error) => null;

/// 카테고리·브랜드·호가 단위·가격 안내. 재고 등록 화면이 열려 있는 동안만 둔다.
@Riverpod(retry: _noRetry)
Future<InventoryFormOptions> inventoryFormOptions(Ref ref) =>
    ref.watch(inventoryRegistrationRepositoryProvider).fetchFormOptions();
