import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/demo_category_repository.dart';
import '../../domain/repositories/category_repository.dart';

part 'category_dependencies.g.dart';

/// 카테고리 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// API가 준비되면 여기서 `DemoCategoryRepository`를 remote 구현으로 바꾼다.
/// 테스트에서는 `categoryRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.
@riverpod
CategoryRepository categoryRepository(Ref ref) =>
    const DemoCategoryRepository();
