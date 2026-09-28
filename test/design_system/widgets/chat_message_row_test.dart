import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';

Widget _wrap(Widget child) {
  return MaterialApp(
    theme: AppTheme.light,
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  testWidgets('ChatMessageRow: 기본은 어두운 글자 + 시각', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const ChatMessageRow(name: '김*빈', message: '많이 매울까요?', time: '오후 8:20'),
      ),
    );
    expect(find.text('오후 8:20'), findsOneWidget);
    final name = tester.widget<Text>(find.text('김*빈'));
    expect(name.style?.color, AppColors.textTertiary);
  });

  testWidgets('ChatMessageRow.onDark: 흰 글자, 시각 없음, 빈 아바타는 실루엣', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const ChatMessageRow(name: '김*륜', message: '냉동실 필수템이죠', onDark: true),
      ),
    );
    expect(find.byType(Text), findsNWidgets(2));
    final name = tester.widget<Text>(find.text('김*륜'));
    final message = tester.widget<Text>(find.text('냉동실 필수템이죠'));
    expect(name.style?.color, AppColors.textInverse);
    expect(message.style?.color, AppColors.textInverse);
    final avatar = tester.widget<AppAvatar>(find.byType(AppAvatar));
    expect(avatar.silhouette, isTrue);
    expect(avatar.borderColor, AppColors.borderInverse);
  });

  testWidgets('ChatMessageRow.maxLines null: 긴 메시지가 줄바꿈된다', (tester) async {
    const long = 'HACCP 인증 받은 믿을 수 있는 제품입니다 정말 길게 써서 두 줄이 되게 합니다';
    await tester.pumpWidget(
      _wrap(
        const SizedBox(
          width: 300,
          child: ChatMessageRow(
            name: '한빛식품',
            message: long,
            time: '오후 8:31',
            isSeller: true,
            isReply: true,
            maxLines: null,
          ),
        ),
      ),
    );
    final text = tester.widget<Text>(find.text(long));
    expect(text.maxLines, isNull);
    expect(text.overflow, isNull);
    expect(tester.getSize(find.text(long)).height, greaterThan(20));
  });
}
