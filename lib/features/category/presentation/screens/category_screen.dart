import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/category_feed.dart';
import '../providers/category_providers.dart';
import '../widgets/category_view.dart';

/// 하단 내비 "카테고리" 탭 화면. 상단 바·하단 내비는 루트 탭이 그린다.
///
/// 대분류 목록 조회 상태만 나누고 실제 레이아웃은 [CategoryView]가 맡는다.
/// 검색·판매자·더보기는 화면이 붙기 전이라 준비 중 안내만 보인다.
class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key, this.onOpenLive});

  /// 라이브 카드를 눌렀을 때. 루트 탭이 라이브 탭으로 잇는다.
  final ValueChanged<LiveSummary>? onOpenLive;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catalog = ref.watch(categoryCatalogProvider);
    return catalog.when(
      loading: () => const AppLoadingView(),
      error: (_, _) => AppErrorView(
        message: '카테고리를 불러오지 못했어요.\n잠시 후 다시 시도해 주세요.',
        onRetry: () => ref.invalidate(categoryCatalogProvider),
      ),
      data: (data) => CategoryView(
        catalog: data,
        onSearch: () => _showPending(context, '검색'),
        onLiveTap: onOpenLive,
        onSellerTap: (_) => _showPending(context, '판매자 홈'),
        onMore: () => _showPending(context, '더보기'),
      ),
    );
  }

  void _showPending(BuildContext context, String feature) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$feature 기능은 준비 중입니다.')));
  }
}
