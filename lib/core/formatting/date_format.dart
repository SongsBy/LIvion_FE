/// 화면 표시용 날짜 포맷. 시각은 버리고 날짜만 쓴다.
library;

/// 날짜 → "2026.09.26". 월·일은 두 자리로 채운다.
String formatDotDate(DateTime date) =>
    '${date.year}.${_twoDigits(date.month)}.${_twoDigits(date.day)}';

/// 날짜 → "9/22". 월·일을 채우지 않는 짧은 표기다.
String formatMonthDay(DateTime date) => '${date.month}/${date.day}';

String _twoDigits(int value) => value.toString().padLeft(2, '0');
