import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/category_feed.dart';
import '../../domain/entities/product_category.dart';
import 'category_dependencies.dart';

part 'category_providers.g.dart';

/// 실패 시 Riverpod 자동 재시도를 끈다. 재시도는 화면의 "다시 시도"와
/// pull-to-refresh로만 하고, API가 붙으면 dio 재시도 정책과 겹치지 않게 한다.
Duration? _noRetry(int retryCount, Object error) => null;

/// 대분류 목록. 카테고리 탭은 루트 탭의 `IndexedStack` 안에서 살아 있으므로 한 번만 받는다.
@Riverpod(retry: _noRetry)
Future<CategoryCatalog> categoryCatalog(Ref ref) =>
    ref.watch(categoryRepositoryProvider).fetchCatalog();

/// 대분류 [categoryId]·하위 분류 [subcategory]의 본문. null이면 하위 분류 "전체".
///
/// 선택마다 별도 provider라, 이전 선택의 늦은 응답이 새 선택을 덮지 않는다.
@Riverpod(retry: _noRetry)
Future<CategoryFeed> categoryFeed(
  Ref ref, {
  required String categoryId,
  String? subcategory,
}) => ref
    .watch(categoryRepositoryProvider)
    .fetchFeed(categoryId: categoryId, subcategory: subcategory);
