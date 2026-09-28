import 'package:flutter_test/flutter_test.dart';

import 'package:livion/core/formatting/number_format.dart';

void main() {
  group('formatThousands', () {
    test('세 자리마다 쉼표', () {
      expect(formatThousands(0), '0');
      expect(formatThousands(999), '999');
      expect(formatThousands(1204), '1,204');
      expect(formatThousands(126000), '126,000');
      expect(formatThousands(1234567), '1,234,567');
    });

    test('음수 부호 유지', () {
      expect(formatThousands(-4500), '-4,500');
    });
  });

  group('formatMultiplier', () {
    test('정수는 소수점 없이', () {
      expect(formatMultiplier(134), '134');
      expect(formatMultiplier(2.0), '2');
    });

    test('소수는 뒤 0을 제거', () {
      expect(formatMultiplier(2.6), '2.6');
      expect(formatMultiplier(1.45), '1.45');
      expect(formatMultiplier(4.80), '4.8');
    });
  });
}
