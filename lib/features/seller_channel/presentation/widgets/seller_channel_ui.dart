import 'package:flutter/material.dart';

import 'package:livion/core/formatting/date_format.dart';
import 'package:livion/core/formatting/duration_format.dart';
import 'package:livion/core/formatting/number_format.dart';
import 'package:livion/core/formatting/time_format.dart';
import 'package:livion/design_system/design_system.dart';
import 'package:livion/shared/presentation/inspection_grade_ui.dart';

import '../../domain/entities/seller_channel.dart';

/// 판매자 페이지 탭 (Figma 판매자 페이지 알약 칩).
enum SellerChannelTab {
  home('홈'),
  contents('콘텐츠'),
  lives('라이브'),
  info('정보');

  const SellerChannelTab(this.label);

  final String label;
}

/// 게시글 날짜 "2026.09.28".
String formatPostDate(DateTime date) => formatDotDate(date);

/// 댓글 시각: 오늘 쓴 댓글은 "오후 8:14", 그 전은 "2026.09.28".
String formatCommentTime(DateTime writtenAt, DateTime now) =>
    DateUtils.isSameDay(writtenAt, now)
    ? formatKoreanClock(writtenAt)
    : formatDotDate(writtenAt);

extension SellerChannelUi on SellerChannel {
  String get followerLabel => '팔로워 ${formatThousands(followerCount)}';

  /// 팔로우 버튼 글자 ("팔로워 1.4천").
  String get followButtonLabel =>
      '팔로워 ${formatShortKoreanCount(followerCount)}';

  List<AppNotice> get noticeItems => [
    for (final n in notices) AppNotice(title: n.title, body: n.body),
  ];
}

extension SellerLiveProductUi on SellerLiveProduct {
  ProductCard toCard({VoidCallback? onTap}) => ProductCard(
    name: name,
    grade: grade.toAppGrade(),
    price: formatThousands(priceWon),
    quantityLabel: '수량 ${formatThousands(quantity)}개',
    dDay: dDay == null ? null : 'D-$dDay',
    startPriceLabel: '시작가 ${formatThousands(startPriceWon)}원',
    multiplier: multiplier == null ? null : formatMultiplier(multiplier!),
    remainingTime: remainingSeconds == null
        ? null
        : formatMinutesSeconds(remainingSeconds!),
    thumbnail: resolveAppImageOrNull(thumbnail),
    onTap: onTap,
  );
}
