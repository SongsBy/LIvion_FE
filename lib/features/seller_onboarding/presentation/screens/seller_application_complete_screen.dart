import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/inventory_registration/presentation/screens/inventory_registration_screen.dart';

import '../../domain/entities/seller_application.dart';
import '../widgets/seller_application_ui.dart';

/// 판매자 심사 접수 완료 (Figma 37:3512). "심사 신청"이 성공하면 신청 폼 대신 열린다.
///
/// 접수번호·채널명·방송 방식은 [receipt]로 받고, 나머지는 정책 문구다.
/// 뒤로 가면 판매자 전환을 시작한 화면으로 돌아간다. "첫 재고 등록하기"와
/// "재고 미리 등록"은 재고 등록 화면을 연다. 편성 예약·판매자 가이드·판매자 센터는
/// 화면이 붙기 전이라 준비 중 안내만 보인다.
class SellerApplicationCompleteScreen extends StatelessWidget {
  const SellerApplicationCompleteScreen({super.key, required this.receipt});

  final SellerApplicationReceipt receipt;

  static const _reviewSteps = ['접수', '서류확인', '채널 개설', '첫 편성'];

  static const _registerStockAction = '재고 미리 등록 (검수는 승인 후 진행)';

  /// 아직 화면이 없는 일: (문구, 준비 중 안내에 쓸 이름).
  static const _pendingActions = [
    ('정기 슬롯 화·목 20:00 편성 예약', '편성 예약'),
    ('판매자 가이드 · 방송 툴 안내 보기', '판매자 가이드'),
  ];

  /// Figma: 접수 정보와 "지금 할 수 있는 일" 사이 25 + 4(바탕색 구분 띠) + 25.
  static const double _sectionBreak =
      AppSpacing.s25 + AppSpacing.s4 + AppSpacing.s25;

  @override
  Widget build(BuildContext context) {
    // extendBody라 아래 padding에 하단 버튼 줄 높이가 들어 있다.
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    return Scaffold(
      backgroundColor: AppColors.backgroundSubtle,
      extendBody: true,
      appBar: AppTopBar.back(onBack: () => Navigator.of(context).maybePop()),
      bottomNavigationBar: AppFrostedBar(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.s16,
          AppSpacing.s8,
          AppSpacing.s16,
          0,
        ),
        // 링크 아래 터치 여백(15)이 있어 Figma 아래 여백 25를 맞춘다.
        minBottom: AppSpacing.s10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppButton.cta(
              label: '첫 재고 등록하기',
              onPressed: () => _registerStock(context),
            ),
            const SizedBox(height: AppSpacing.s4),
            AppTextLink(
              label: '판매자 센터 둘러보기',
              onTap: () => _showPending(context, '판매자 센터'),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.s16,
          0,
          AppSpacing.s16,
          bottomInset + AppSpacing.s24,
        ),
        children: [
          const AppResultHeader(
            title: '판매자 심사 접수 완료',
            message: '영업일 2일 이내 결과를 알려드려요.\n심사 중에도 재고를 미리 등록할 수 있어요.',
          ),
          const SizedBox(height: AppSpacing.s25),
          const AppStepProgress(labels: _reviewSteps, completedCount: 1),
          const SizedBox(height: AppSpacing.s25),
          AppPanel(
            padding: const EdgeInsets.all(AppSpacing.s16),
            child: Column(
              children: [
                AppInfoRow(label: '접수번호', value: receipt.receiptNumber),
                ..._divided(
                  AppInfoRow(label: '채널명', value: receipt.channelName),
                ),
                ..._divided(
                  AppInfoRow(
                    label: '방송 방식',
                    value: receipt.broadcastMode.shortLabel,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: _sectionBreak),
          Text('지금 할 수 있는 일', style: AppTextStyles.archivoH1),
          const SizedBox(height: AppSpacing.s16),
          AppNavRow(
            label: _registerStockAction,
            onTap: () => _registerStock(context),
          ),
          for (final (label, feature) in _pendingActions) ...[
            const SizedBox(height: AppSpacing.s8),
            AppNavRow(
              label: label,
              onTap: () => _showPending(context, feature),
            ),
          ],
        ],
      ),
    );
  }

  static List<Widget> _divided(Widget row) => [
    const SizedBox(height: AppSpacing.s16),
    const AppDivider(),
    const SizedBox(height: AppSpacing.s16),
    row,
  ];

  /// 재고 등록 화면을 열고, 신청을 마치고 돌아오면 접수 안내를 띄운다.
  Future<void> _registerStock(BuildContext context) async {
    final receipt = await InventoryRegistrationScreen.open(context);
    if (receipt == null || !context.mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('검수 요청과 편성 신청을 접수했어요. (${receipt.listingId})')),
      );
  }

  void _showPending(BuildContext context, String feature) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$feature 기능은 준비 중입니다.')));
  }
}
