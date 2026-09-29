import '../../domain/entities/seller_application.dart';

/// 판매자 전환 데모 데이터. API가 붙으면 서버 값으로 바뀐다.
abstract final class SellerOnboardingDemoData {
  /// Figma 판매자 전환_05 (37:3324) 은행 선택 순서. 코드는 금융결제원 은행 코드.
  static const banks = [
    SettlementBank(code: '090', name: '카카오뱅크'),
    SettlementBank(code: '092', name: '토스뱅크'),
    SettlementBank(code: '089', name: '케이뱅크'),
    SettlementBank(code: '004', name: 'KB국민은행'),
    SettlementBank(code: '088', name: '신한은행'),
    SettlementBank(code: '020', name: '우리은행'),
    SettlementBank(code: '023', name: 'SC제일은행'),
    SettlementBank(code: '081', name: 'KEB하나은행'),
    SettlementBank(code: '027', name: '시티은행'),
    SettlementBank(code: '003', name: 'IBK기업은행'),
    SettlementBank(code: '011', name: 'NH농협은행'),
    SettlementBank(code: '071', name: '우체국'),
    SettlementBank(code: '045', name: 'MG새마을금고'),
    SettlementBank(code: '032', name: '부산은행'),
    SettlementBank(code: '007', name: '수협은행'),
    SettlementBank(code: '002', name: 'KDB산업은행'),
    SettlementBank(code: '048', name: '신협'),
    SettlementBank(code: '034', name: '광주은행'),
    SettlementBank(code: '050', name: 'SBI저축은행'),
    SettlementBank(code: '031', name: 'IM뱅크'),
  ];

  /// 이미 쓰이는 채널명 (소문자로 비교). 중복확인 거절을 보여 주는 용도.
  static const takenChannelNames = {'livion', '리비온', '한빛식품'};

  /// 휴대폰 인증번호 유효 시간.
  static const phoneCodeValidity = Duration(minutes: 3);

  /// 채널명을 비워 둔 채 신청한 데모에서 접수 결과에 보일 이름 (데모 판매자 계정과 같다).
  static const fallbackChannelName = '한빛식품';

  /// 접수번호 뒤 일련번호.
  static const receiptSequence = 42;

  /// "S-260914-0042": 접수일(yyMMdd) + 일련번호 4자리.
  static String receiptNumber(DateTime date) {
    String two(int v) => v.toString().padLeft(2, '0');
    final day = '${two(date.year % 100)}${two(date.month)}${two(date.day)}';
    return 'S-$day-${receiptSequence.toString().padLeft(4, '0')}';
  }
}
