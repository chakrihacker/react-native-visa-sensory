package com.visasensory

import android.graphics.Color
import android.view.View
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp
import com.visa.SensoryBrandingView

class VisaSensoryViewManager : SimpleViewManager<View>() {
  override fun getName() = "VisaSensory"

  private lateinit var visaSensoryView: VisaSensoryView

  override fun createViewInstance(reactContext: ThemedReactContext): SensoryBrandingView {
    val sensoryBrandingView = reactContext.currentActivity?.let { SensoryBrandingView(it, null) }
    visaSensoryView = sensoryBrandingView?.let { VisaSensoryView(it, reactContext) }!!
    return sensoryBrandingView
  }

  @ReactProp(name = "isHapticFeedbackEnabled")
  fun setIsHapticFeedbackEnabled(view: SensoryBrandingView, isHapticFeedbackEnabled: Boolean) {
    visaSensoryView.setIsHapticFeedbackEnabled(isHapticFeedbackEnabled)
  }

  @ReactProp(name = "isSoundEnabled")
  fun setIsSoundEnabled(view: SensoryBrandingView, isSoundEnabled: Boolean) {
    visaSensoryView.setIsSoundEnabled(isSoundEnabled)
  }

  @ReactProp(name = "checkmarkMode")
  fun setCheckmarkMode(view: SensoryBrandingView, checkmarkMode: String) {
    visaSensoryView.setCheckmarkMode(checkmarkMode)
  }
}
