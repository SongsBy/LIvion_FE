import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/demo_live_detail_repository.dart';
import '../../domain/repositories/live_detail_repository.dart';

part 'live_detail_dependencies.g.dart';

/// 라이브 상세 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// API가 준비되면 여기서 `DemoLiveDetailRepository`를 remote 구현으로 바꾼다.
/// 테스트에서는 `liveDetailRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.
@riverpod
LiveDetailRepository liveDetailRepository(Ref ref) =>
    const DemoLiveDetailRepository();
