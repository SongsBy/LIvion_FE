/// 서버 확인 요청 한 건의 상태 (중복 확인, 인증번호, 계좌 인증 …).
enum CheckStatus {
  idle,
  checking,
  passed,

  /// 서버가 거절 (없는 사업자, 틀린 인증번호, 중복 아이디·채널명 …).
  rejected,

  /// 인증번호 유효 시간이 지났다.
  expired,

  /// 통신 실패. 다시 시도할 수 있다.
  failed;

  bool get isChecking => this == checking;
  bool get isPassed => this == passed;
}
