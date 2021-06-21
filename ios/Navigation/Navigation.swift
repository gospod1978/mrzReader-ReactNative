
import Foundation

struct pressSelfie {
  static var scanButton: Int! = 0
}

@objc(Navigation)
class Navigation: NSObject {
  
  
  @objc
  func navigateTo(_ destination: NSString) -> Void {
    let modelVC: UIViewController;
    switch destination {
    case "MrzReader":
      modelVC = MrzReaderViewController()
    case "IDScan":
      modelVC = ScanIDViewController()
    case "Selfie":
      pressSelfie.scanButton = 1
      modelVC = SelfieViewController()
    default:
      return;
    }
    DispatchQueue.main.async {
      let navController = UINavigationController(rootViewController: modelVC)
      navController.modalPresentationStyle = .fullScreen
      let topController = UIApplication.topMostViewController()
      topController?.present(navController, animated: true, completion: nil)
    }
  }
  
  @objc
   func goBack() -> Void {
     DispatchQueue.main.async {
       let topController = UIApplication.topMostViewController()
       topController?.dismiss(animated: true, completion: nil)
     }
   }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
