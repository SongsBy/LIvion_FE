/// 폰트 패밀리 토큰. pubspec.yaml의 `fonts.family`와 같은 이름을 쓴다.
///
/// Figma Text Sheet(node 26:1775) 기준으로 두 서체를 사용한다.
/// - Pretendard: 한글·본문·라벨 (Regular 400, Medium 500, SemiBold 600, Bold 700)
/// - Archivo: 영문 숫자·버튼·섹션 제목·등급 (Regular 400 ~ ExtraBold 800, wdth 100)
abstract final class AppFonts {
  static const String pretendard = 'Pretendard';
  static const String archivo = 'Archivo';
}
