import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

/// 경매 상세 상단 상품 사진 줄 (Figma 37:6134).
///
/// 고른 사진은 145로 크게 왼쪽에, 나머지는 112로 작게 반투명하게 아래를 맞춰 잇는다.
/// 작은 사진을 누르거나 옆으로 밀면 다음·이전 사진을 고르고, 고른 사진이 왼쪽으로 온다.
/// 큰 사진 오른쪽 아래에 "1 / 3" 순번이 붙는다.
class AuctionImageGallery extends StatefulWidget {
  const AuctionImageGallery({super.key, required this.images});

  final List<ImageProvider> images;

  static const double selectedSize = 145;
  static const double itemSize = 112;
  static const double _gap = AppSpacing.s12;

  /// 이만큼 밀거나 이 속도(px/s)보다 빠르게 밀면 사진을 넘긴다.
  static const double _swipeDistance = AppSpacing.s24;
  static const double _swipeVelocity = 300;

  static const Duration _duration = Duration(milliseconds: 200);

  @override
  State<AuctionImageGallery> createState() => _AuctionImageGalleryState();
}

class _AuctionImageGalleryState extends State<AuctionImageGallery> {
  final ScrollController _scroll = ScrollController();
  int _index = 0;
  double _dragDx = 0;

  @override
  void didUpdateWidget(covariant AuctionImageGallery oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_index >= widget.images.length) _index = 0;
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _select(int index) {
    if (index < 0 || index >= widget.images.length || index == _index) return;
    setState(() => _index = index);
    if (!_scroll.hasClients) return;
    // 고른 사진 앞에는 작은 사진만 있으므로 그만큼 밀면 왼쪽에 온다. 끝은 넘지 않는다.
    final target = math.min(
      index * (AuctionImageGallery.itemSize + AuctionImageGallery._gap),
      _scroll.position.maxScrollExtent,
    );
    _scroll.animateTo(
      target,
      duration: AuctionImageGallery._duration,
      curve: Curves.easeOut,
    );
  }

  void _onDragEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    if (_dragDx <= -AuctionImageGallery._swipeDistance ||
        velocity <= -AuctionImageGallery._swipeVelocity) {
      _select(_index + 1);
    } else if (_dragDx >= AuctionImageGallery._swipeDistance ||
        velocity >= AuctionImageGallery._swipeVelocity) {
      _select(_index - 1);
    }
    _dragDx = 0;
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.images;
    if (images.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.s16),
        child: AppThumbnail.square(size: AuctionImageGallery.selectedSize),
      );
    }
    return GestureDetector(
      onHorizontalDragStart: (_) => _dragDx = 0,
      onHorizontalDragUpdate: (details) => _dragDx += details.delta.dx,
      onHorizontalDragEnd: _onDragEnd,
      child: SizedBox(
        height: AuctionImageGallery.selectedSize,
        child: ListView.separated(
          controller: _scroll,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
          itemCount: images.length,
          separatorBuilder: (_, _) =>
              const SizedBox(width: AuctionImageGallery._gap),
          itemBuilder: (_, i) => _GalleryImage(
            image: images[i],
            selected: i == _index,
            counter: '${i + 1} / ${images.length}',
            onTap: () => _select(i),
          ),
        ),
      ),
    );
  }
}

class _GalleryImage extends StatelessWidget {
  const _GalleryImage({
    required this.image,
    required this.selected,
    required this.counter,
    required this.onTap,
  });

  final ImageProvider image;
  final bool selected;

  /// "1 / 3"
  final String counter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = selected
        ? AuctionImageGallery.selectedSize
        : AuctionImageGallery.itemSize;
    return Semantics(
      image: true,
      selected: selected,
      button: !selected,
      label: '상품 사진 $counter',
      child: GestureDetector(
        onTap: selected ? null : onTap,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedOpacity(
            opacity: selected ? 1 : AppOpacity.muted,
            duration: AuctionImageGallery._duration,
            child: AnimatedContainer(
              width: size,
              height: size,
              duration: AuctionImageGallery._duration,
              curve: Curves.easeOut,
              child: AppThumbnail(
                image: image,
                child: selected
                    ? Stack(
                        children: [
                          Positioned(
                            right: AppSpacing.s12,
                            bottom: AppSpacing.s10,
                            child: ExcludeSemantics(
                              child: _PageCounter(counter),
                            ),
                          ),
                        ],
                      )
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 사진 위 어두운 반투명 "2 / 3" (높이 16, radius 4).
class _PageCounter extends StatelessWidget {
  const _PageCounter(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppControlHeight.badgeSm,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s4),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.backgroundDim,
        borderRadius: AppRadius.r4All,
      ),
      child: Text(
        text,
        style: AppTextStyles.pretendardCaption2.copyWith(
          color: AppColors.textInverseSub,
        ),
      ),
    );
  }
}
