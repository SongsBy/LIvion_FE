/// 화면 표시용 숫자 포맷. 금액은 최소 화폐 단위 정수(원)로 받는다.
library;

final RegExp _thousands = RegExp(r'(\d)(?=(\d{3})+(?!\d))');

/// 1204 → "1,204". 음수도 부호를 유지한다.
String formatThousands(int value) {
  final digits = value.abs().toString().replaceAllMapped(
    _thousands,
    (m) => '${m[1]},',
  );
  return value < 0 ? '-$digits' : digits;
}

/// 시작가 대비 배수. 2.6 → "2.6", 1.45 → "1.45", 134.0 → "134".
String formatMultiplier(double value) {
  if (value == value.roundToDouble()) return value.toInt().toString();
  var text = value.toStringAsFixed(2);
  while (text.endsWith('0')) {
    text = text.substring(0, text.length - 1);
  }
  return text;
}

/// 축 눈금용 짧은 원화 표기. 3000 → "3천", 12000 → "1.2만", 500 → "500".
/// 만 미만은 천 단위, 만 이상은 만 단위로 줄이고 소수 0은 버린다.
String formatShortKoreanWon(int won) => formatShortKoreanCount(won);

/// 수를 천·만 단위로 줄인다. 1435 → "1.4천", 16000 → "1.6만", 500 → "500".
/// 팔로워 수처럼 자리가 좁은 곳에 쓴다.
String formatShortKoreanCount(int value) {
  if (value.abs() < 1000) return value.toString();
  if (value.abs() < 10000) return '${_trimDecimal(value / 1000)}천';
  return '${_trimDecimal(value / 10000)}만';
}

String _trimDecimal(double value) {
  if (value == value.roundToDouble()) return value.toInt().toString();
  var text = value.toStringAsFixed(1);
  if (text.endsWith('0')) text = text.substring(0, text.length - 2);
  return text;
}
