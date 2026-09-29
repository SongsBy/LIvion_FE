import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_avatar.dart';

/// [AppLiveAvatarList] 한 칸에 보일 값.
class AppLiveAvatarItem {
  const AppLiveAvatarItem({
    required this.name,
    this.image,
    this.isLive = false,
  });

  final String name;
  final ImageProvider? image;
  final bool isLive;
}

/// 판매자 가로 목록. [AppLiveAvatar](62×66) + 이름.
///
/// 홈 "팔로우한 판매자", 카테고리 "인기 판매자"가 같이 쓴다.
class AppLiveAvatarList extends StatelessWidget {
  const AppLiveAvatarList({super.key, required this.items, this.onTap});

  final List<AppLiveAvatarItem> items;

  /// 누른 칸의 index.
  final ValueChanged<int>? onTap;

  /// 아바타 66 + 간격 8 + 이름 12.
  static const double _itemHeight = AppLiveAvatar.height + AppSpacing.s8 + 12;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _itemHeight + AppSpacing.s4,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
          left: AppSpacing.s16,
          right: AppSpacing.s16,
          bottom: AppSpacing.s4,
        ),
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.s12),
        itemBuilder: (_, i) => _Tile(
          item: items[i],
          onTap: onTap == null ? null : () => onTap!(i),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({required this.item, required this.onTap});

  final AppLiveAvatarItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: item.isLive ? '${item.name} 라이브 중' : item.name,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.r8All,
        child: SizedBox(
          width: AppLiveAvatar.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppLiveAvatar(image: item.image, isLive: item.isLive),
              const SizedBox(height: AppSpacing.s8),
              ExcludeSemantics(
                child: Text(
                  item.name,
                  style: AppTextStyles.pretendardCaption1Regular,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
