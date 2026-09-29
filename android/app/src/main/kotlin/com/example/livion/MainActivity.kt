package com.example.livion

import android.annotation.SuppressLint
import android.content.res.Configuration
import org.opentraa.pip.PipActivity

// `pip` 플러그인의 PipActivity를 상속해 Android 8~11에서도 앱을 떠날 때
// (onUserLeaveHint) PiP로 자동 진입한다. 12+는 setAutoEnterEnabled로 들어간다.
// PipActivity는 API 26+ 전용이지만 그 아래에서는 PiP 콜백 자체가 오지 않는다.
@SuppressLint("NewApi")
class MainActivity : PipActivity() {
    // pip 0.0.3은 Dart에서 setup을 한 번도 부르지 않은 상태로 아래 콜백이 오면
    // 내부 파라미터가 null이라 NullPointerException을 던진다. Flutter 쪽 처리는
    // super 안에서 먼저 끝나므로, 플러그인 리스너의 NPE만 삼킨다.
    override fun onUserLeaveHint() {
        try {
            super.onUserLeaveHint()
        } catch (_: NullPointerException) {
        }
    }

    override fun onPictureInPictureModeChanged(
        isInPictureInPictureMode: Boolean,
        newConfig: Configuration,
    ) {
        try {
            super.onPictureInPictureModeChanged(isInPictureInPictureMode, newConfig)
        } catch (_: NullPointerException) {
        }
    }
}
