package com.visasensory

import android.graphics.Color
import android.view.View
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp
import com.visa.CheckmarkMode
import com.visa.CheckmarkTextOption
import com.visa.SensoryBrandingView

class VisaSensoryView(private val sensoryBrandingView: SensoryBrandingView, private  val reactContext: ThemedReactContext) {
  init {
      sensoryBrandingView.apply {
        backdropColor = Color.parseColor("#123333")
        languageCode = "en"
        hapticEnabled = true
        soundEnabled = true
        checkmarkMode = CheckmarkMode.CHECKMARK
        checkmarkText = CheckmarkTextOption.APPROVE
      }
  }

  fun setIsHapticFeedbackEnabled(isHapticFeedbackEnabled: Boolean) {
    sensoryBrandingView.hapticEnabled = isHapticFeedbackEnabled
  }

  fun setIsSoundEnabled(isSoundEnabled: Boolean) {
    sensoryBrandingView.soundEnabled = isSoundEnabled
  }

  fun setCheckmarkMode(checkmarkMode: String) {
    when (checkmarkMode) {
        "checkmark" -> {
          sensoryBrandingView.checkmarkMode = CheckmarkMode.CHECKMARK
        }
        "checkmarkWithText" -> {
          sensoryBrandingView.checkmarkMode = CheckmarkMode.CHECKMARK_WITH_TEXT
        }
        else -> {
          sensoryBrandingView.checkmarkMode = CheckmarkMode.NONE
        }
    }
  }
}
