import VisaSensoryBranding

@objc(VisaSensoryViewManager)
class VisaSensoryViewManager: RCTViewManager {

  override func view() -> (VisaSensoryView) {
    return VisaSensoryView()
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  @objc
  final func startAnimation(_ node: NSNumber) {
    let component = self.bridge.uiManager.view(forReactTag: node) as! VisaSensoryView
    component.startAnimation()
  }
}

class VisaSensoryView : UIView {
  var sensoryBranding: SensoryBranding
  
  override init(frame: CGRect) {
    sensoryBranding = SensoryBranding.init()
    super.init(frame: frame)
    addSubview(sensoryBranding)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc var color: String = "" {
    didSet {
      self.backgroundColor = hexStringToUIColor(hexColor: color)
    }
  }
  
  func startAnimation() {
    sensoryBranding.animate()
  }

  func hexStringToUIColor(hexColor: String) -> UIColor {
    let stringScanner = Scanner(string: hexColor)

    if(hexColor.hasPrefix("#")) {
      stringScanner.scanLocation = 1
    }
    var color: UInt32 = 0
    stringScanner.scanHexInt32(&color)

    let r = CGFloat(Int(color >> 16) & 0x000000FF)
    let g = CGFloat(Int(color >> 8) & 0x000000FF)
    let b = CGFloat(Int(color) & 0x000000FF)

    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
  }
}
