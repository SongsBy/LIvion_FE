import 'package:flutter_test/flutter_test.dart';

import 'package:livion/core/formatting/date_format.dart';

void main() {
  test('formatDotDate는 월·일을 두 자리로 채운다', () {
    expect(formatDotDate(DateTime(2026, 9, 26)), '2026.09.26');
    expect(formatDotDate(DateTime(2026, 1, 5, 23, 59)), '2026.01.05');
  });

  test('formatMonthDay는 채우지 않은 짧은 표기다', () {
    expect(formatMonthDay(DateTime(2026, 9, 22)), '9/22');
    expect(formatMonthDay(DateTime(2026, 10, 3)), '10/3');
  });
}
