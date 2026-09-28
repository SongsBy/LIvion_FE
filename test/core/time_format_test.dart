import 'package:flutter_test/flutter_test.dart';

import 'package:livion/core/formatting/number_format.dart';
import 'package:livion/core/formatting/time_format.dart';

void main() {
  test('formatKoreanClock: 오전/오후 + 12시간제, 분은 두 자리', () {
    expect(formatKoreanClock(DateTime(2026, 9, 28, 20, 14)), '오후 8:14');
    expect(formatKoreanClock(DateTime(2026, 9, 28, 9, 5)), '오전 9:05');
    expect(formatKoreanClock(DateTime(2026, 9, 28, 0, 30)), '오전 12:30');
    expect(formatKoreanClock(DateTime(2026, 9, 28, 12, 0)), '오후 12:00');
  });

  test('formatTimeAgo: 초·분·시간·일 단위, 0 이하는 방금', () {
    expect(formatTimeAgo(const Duration(seconds: 3)), '3초전');
    expect(formatTimeAgo(const Duration(seconds: 59)), '59초전');
    expect(formatTimeAgo(const Duration(minutes: 2, seconds: 30)), '2분전');
    expect(formatTimeAgo(const Duration(hours: 1, minutes: 59)), '1시간전');
    expect(formatTimeAgo(const Duration(days: 3)), '3일전');
    expect(formatTimeAgo(Duration.zero), '방금');
    expect(formatTimeAgo(const Duration(seconds: -5)), '방금');
  });

  test('formatElapsedShort: m:ss, 분 자리는 채우지 않고 음수는 0', () {
    expect(formatElapsedShort(0), '0:00');
    expect(formatElapsedShort(120), '2:00');
    expect(formatElapsedShort(605), '10:05');
    expect(formatElapsedShort(-3), '0:00');
  });

  test('formatShortKoreanWon: 천·만 단위로 줄이고 소수 0은 버린다', () {
    expect(formatShortKoreanWon(3000), '3천');
    expect(formatShortKoreanWon(7500), '7.5천');
    expect(formatShortKoreanWon(9000), '9천');
    expect(formatShortKoreanWon(10000), '1만');
    expect(formatShortKoreanWon(12000), '1.2만');
    expect(formatShortKoreanWon(500), '500');
    expect(formatShortKoreanWon(0), '0');
  });
}
