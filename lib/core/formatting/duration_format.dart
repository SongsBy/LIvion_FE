/// 화면 표시용 시간 포맷.
library;

/// 남은 초 → "mm:ss". 47 → "00:47", 3671 → "61:11". 음수는 0으로 본다.
String formatMinutesSeconds(int seconds) {
  final total = seconds < 0 ? 0 : seconds;
  final minutes = total ~/ 60;
  final rest = total % 60;
  return '${minutes.toString().padLeft(2, '0')}:'
      '${rest.toString().padLeft(2, '0')}';
}
