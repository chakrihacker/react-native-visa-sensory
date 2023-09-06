package com.visasensory

import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.UIBlock
import com.facebook.react.uimanager.UIManagerModule
import com.visa.SensoryBrandingView

@ReactModule(name = VisaSensoryModule.TAG)
class VisaSensoryModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
  companion object {
    const val TAG = "VisaSensory"
  }
  override fun getName(): String {
    return TAG
  }

  @ReactMethod
  fun animate(viewTag: Int, promise: Promise) {
    val uiManagerModule = reactApplicationContext.getNativeModule(UIManagerModule::class.java)
    uiManagerModule?.addUIBlock(UIBlock { nativeViewHierarchyManager ->
      val view = nativeViewHierarchyManager.resolveView(viewTag) as SensoryBrandingView
      view.animate { result ->
        if (result == null) {
          promise.resolve(true)
        } else {
          promise.reject(result)
        }
      }
    })
  }
}
