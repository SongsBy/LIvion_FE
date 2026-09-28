import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// 디자인 값은 lib/design_system/tokens 에만 선언한다.
/// 그 밖의 lib 코드에서 색상·글자 스타일을 직접 만들면 실패한다.
void main() {
  test('lib 코드는 색상·TextStyle을 하드코딩하지 않는다', () {
    final tokensDir = Directory('lib/design_system/tokens').absolute.path;
    final forbidden = RegExp(r'Color\(0x|\bColors\.|\bTextStyle\(');

    final violations = <String>[];
    for (final entity in Directory('lib').listSync(recursive: true)) {
      if (entity is! File || !entity.path.endsWith('.dart')) continue;
      if (entity.absolute.path.startsWith(tokensDir)) continue;

      final lines = entity.readAsLinesSync();
      for (var i = 0; i < lines.length; i++) {
        if (forbidden.hasMatch(lines[i])) {
          violations.add('${entity.path}:${i + 1}: ${lines[i].trim()}');
        }
      }
    }

    expect(
      violations,
      isEmpty,
      reason: 'AppColors / AppTextStyles 토큰을 사용하세요:\n${violations.join('\n')}',
    );
  });
}
