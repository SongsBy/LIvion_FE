import AVFoundation
import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    if let registrar = registrar(forPlugin: "LivionPipContent") {
      PipContentChannel.register(with: registrar)
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

/// `livion/pip_content` 채널: `pip` 플러그인이 iOS PiP 창에 붙일 네이티브 뷰를 만든다.
///
/// iOS PiP(AVKit)는 Flutter 위젯을 그릴 수 없어서 방송 화면을 UIImageView로 그린다.
/// 영상 스트림이 붙으면 이 뷰를 AVPlayerLayer를 가진 뷰로 바꾼다.
/// Dart 쪽은 `lib/core/pip/plugin_picture_in_picture.dart`가 부른다.
final class PipContentChannel: NSObject {
  private let registrar: FlutterPluginRegistrar

  /// Dart에 넘긴 뷰 핸들(포인터 값) → 뷰. dispose 전까지 여기서 붙잡아 둔다.
  private var views: [Int: UIView] = [:]

  private init(registrar: FlutterPluginRegistrar) {
    self.registrar = registrar
  }

  static func register(with registrar: FlutterPluginRegistrar) {
    let instance = PipContentChannel(registrar: registrar)
    let channel = FlutterMethodChannel(
      name: "livion/pip_content", binaryMessenger: registrar.messenger())
    channel.setMethodCallHandler { call, result in
      instance.handle(call, result: result)
    }
  }

  private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any]
    switch call.method {
    case "create":
      guard let source = args?["image"] as? String else {
        result(FlutterError(code: "bad_args", message: "image가 없습니다.", details: nil))
        return
      }
      // 오디오 세션이 활성이어야 PiP가 가능(isPictureInPicturePossible)해진다.
      // 다른 앱의 소리를 끊지 않도록 섞어 재생한다.
      let session = AVAudioSession.sharedInstance()
      try? session.setCategory(.playback, mode: .moviePlayback, options: [.mixWithOthers])
      try? session.setActive(true)

      let view = UIImageView(frame: .zero)
      view.contentMode = .scaleAspectFill
      view.clipsToBounds = true
      view.backgroundColor = .black
      load(source, into: view)

      let handle = Int(bitPattern: Unmanaged.passUnretained(view).toOpaque())
      views[handle] = view
      result(handle)
    case "dispose":
      if let handle = args?["view"] as? Int, let view = views.removeValue(forKey: handle) {
        view.removeFromSuperview()
      }
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  /// `asset/`로 시작하면 Flutter 번들 에셋, 그 외에는 https URL로 읽는다.
  private func load(_ source: String, into view: UIImageView) {
    if source.hasPrefix("asset/") {
      let key = registrar.lookupKey(forAsset: source)
      if let path = Bundle.main.path(forResource: key, ofType: nil) {
        view.image = UIImage(contentsOfFile: path)
      }
      return
    }
    guard let url = URL(string: source), url.scheme == "https" else { return }
    URLSession.shared.dataTask(with: url) { [weak view] data, _, _ in
      guard let data = data, let image = UIImage(data: data) else { return }
      DispatchQueue.main.async { view?.image = image }
    }.resume()
  }
}
