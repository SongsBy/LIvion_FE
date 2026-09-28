import 'package:flutter/material.dart';

import 'package:livion/design_system/tokens/tokens.dart';

import 'color_sheet_screen.dart';
import 'components_sheet_screen.dart';
import 'text_sheet_screen.dart';

/// 디자인 시스템 갤러리. Color / Text 시트를 탭으로 전환한다.
class DesignGalleryScreen extends StatelessWidget {
  const DesignGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Design System', style: AppTextStyles.archivoH1),
          bottom: TabBar(
            labelStyle: AppTextStyles.archivoLabel,
            tabs: const [
              Tab(text: 'Color'),
              Tab(text: 'Text'),
              Tab(text: 'Components'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ColorSheetScreen(),
            TextSheetScreen(),
            ComponentsSheetScreen(),
          ],
        ),
      ),
    );
  }
}
