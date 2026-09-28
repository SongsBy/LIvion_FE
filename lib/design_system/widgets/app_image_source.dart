import 'package:flutter/widgets.dart';

/// 문자열 이미지 출처를 [ImageProvider]로 바꾼다.
///
/// `asset/`로 시작하면 번들 에셋, 그 외는 네트워크 URL로 본다.
/// domain entity는 Flutter를 모르므로 경로 문자열만 들고, 변환은 presentation에서 한다.
ImageProvider resolveAppImage(String source) {
  if (source.startsWith('asset/')) return AssetImage(source);
  return NetworkImage(source);
}

ImageProvider? resolveAppImageOrNull(String? source) {
  if (source == null || source.isEmpty) return null;
  return resolveAppImage(source);
}
