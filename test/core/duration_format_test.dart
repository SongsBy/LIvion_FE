import 'package:flutter_test/flutter_test.dart';

import 'package:livion/core/formatting/duration_format.dart';

void main() {
  test('formatMinutesSeconds: mm:ss, 60분 넘으면 분이 늘어나고 음수는 0', () {
    expect(formatMinutesSeconds(47), '00:47');
    expect(formatMinutesSeconds(0), '00:00');
    expect(formatMinutesSeconds(605), '10:05');
    expect(formatMinutesSeconds(3671), '61:11');
    expect(formatMinutesSeconds(-5), '00:00');
  });
}
