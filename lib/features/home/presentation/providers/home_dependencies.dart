import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/demo_home_repository.dart';
import '../../domain/repositories/home_repository.dart';

part 'home_dependencies.g.dart';

/// 홈 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// API가 준비되면 여기서 `DemoHomeRepository`를 remote 구현으로 바꾼다.
/// 화면·notifier는 [HomeRepository] interface만 알기 때문에 다른 곳은 손대지 않는다.
/// 테스트에서는 `homeRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.
@riverpod
HomeRepository homeRepository(Ref ref) => const DemoHomeRepository();
