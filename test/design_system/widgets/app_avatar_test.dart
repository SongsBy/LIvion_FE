import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:livion/design_system/design_system.dart';

void main() {
  testWidgets('빈 아바타 실루엣은 Figma empty_avatar 비율(48 안의 52, 위 2px)로 놓인다', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Center(
          child: AppAvatar(
            size: AppAvatarSize.md,
            silhouette: true,
            borderColor: AppColors.borderInverse,
            borderWidth: AppBorderWidth.thick,
          ),
        ),
      ),
    );

    final avatar = tester.getRect(find.byType(AppAvatar));
    final silhouette = tester.getRect(find.byType(SvgPicture));

    expect(avatar.size, const Size(48, 48));
    expect(silhouette.size, const Size(52, 52));
    // Figma: User 프레임 x=-2, y=2 (empty_avatar 기준)
    expect(silhouette.left - avatar.left, -2);
    expect(silhouette.top - avatar.top, 2);
  });

  testWidgets('테두리가 있어도 실루엣 위치는 아바타 전체 기준으로 같다', (tester) async {
    Future<Offset> silhouetteOffset(Color? border) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: AppAvatar(
              size: AppAvatarSize.xs,
              silhouette: true,
              borderColor: border,
              borderWidth: AppBorderWidth.thick,
            ),
          ),
        ),
      );
      final avatar = tester.getRect(find.byType(AppAvatar));
      final s = tester.getRect(find.byType(SvgPicture));
      return Offset(s.left - avatar.left, s.top - avatar.top);
    }

    final plain = await silhouetteOffset(null);
    final bordered = await silhouetteOffset(AppColors.borderInverse);
    expect(plain, const Offset(-1, 1));
    expect(bordered, plain);
  });
}
