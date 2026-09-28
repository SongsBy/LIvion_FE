/// 화면 표시용 시각·상대 시간 포맷.
library;

/// 시각 → "오후 8:14" / "오전 9:05". 기기 로컬 시각 기준이며 초는 버린다.
String formatKoreanClock(DateTime time) {
  final hour = time.hour;
  final period = hour < 12 ? '오전' : '오후';
  var displayHour = hour % 12;
  if (displayHour == 0) displayHour = 12;
  final minute = time.minute.toString().padLeft(2, '0');
  return '$period $displayHour:$minute';
}

/// 경과 시간 → "3초전", "2분전", "1시간전", "3일전". 음수·0은 "방금".
String formatTimeAgo(Duration elapsed) {
  if (elapsed.inSeconds <= 0) return '방금';
  if (elapsed.inMinutes < 1) return '${elapsed.inSeconds}초전';
  if (elapsed.inHours < 1) return '${elapsed.inMinutes}분전';
  if (elapsed.inDays < 1) return '${elapsed.inHours}시간전';
  return '${elapsed.inDays}일전';
}

/// 경과 초 → "m:ss". 0 → "0:00", 120 → "2:00", 605 → "10:05". 음수는 0으로 본다.
/// 차트 x축처럼 분 자리를 채우지 않는 짧은 표기다. 채운 표기는 `formatMinutesSeconds`.
String formatElapsedShort(int seconds) {
  final total = seconds < 0 ? 0 : seconds;
  final minutes = total ~/ 60;
  final rest = total % 60;
  return '$minutes:${rest.toString().padLeft(2, '0')}';
}
