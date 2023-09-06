import VisaSensoryBranding

@objc(VisaSensoryViewManager)
class VisaSensoryViewManager: RCTViewManager {

  override func view() -> UIView! {
    return VisaSensoryView()
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  @objc
  final func animate(_ node: NSNumber, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    DispatchQueue.main.async {
      let component = self.bridge.uiManager.view(forReactTag: node) as! VisaSensoryView
      component.startAnimation(resolve: resolve, reject: reject)
    }
  }
}

class VisaSensoryView : UIView {
  // Start: Internal Properties
  // var mIsHapticFeedbackEnabled: Bool = true
  var mIsSoundEnabled = true
  // END: Internal Properties
  
  // Start: React props
  @objc var isHapticFeedbackEnabled = true
  @objc var isSoundEnabled = true
  @objc var checkmarkMode = "checkmark"
  // END: React props
  
  var sensoryBranding: SensoryBranding
  
  override init(frame: CGRect) {
    sensoryBranding = SensoryBranding.init()
    super.init(frame: frame)
    addSubview(sensoryBranding)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func startAnimation(resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    sensoryBranding.isHapticFeedbackEnabled = self.isHapticFeedbackEnabled
    sensoryBranding.isSoundEnabled = self.mIsSoundEnabled
    if(checkmarkMode == "checkmark") {
      sensoryBranding.checkmarkMode = .checkmark
    } else if (checkmarkMode == "checkmarkWithText") {
      sensoryBranding.checkmarkMode = .checkmarkWithText
    } else {
      sensoryBranding.checkmarkMode = .none
    }
    
    sensoryBranding.animate { result, err in
      if((err) != nil) {
        reject(err.debugDescription, err?.localizedDescription, err)
      }
      if(result) {
        resolve(result)
      }
    }
  }
}
