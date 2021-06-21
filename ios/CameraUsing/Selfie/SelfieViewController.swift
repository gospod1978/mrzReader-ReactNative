
import Foundation

class SelfieViewController: UIViewController, QKMRZScannerViewDelegateMy {
  func mrzScannerView(_ mrzScannerView: QKMRZScannerViewMy, didFind scanResult: QKMRZScanResultMy) {
    let imgObj =  scanResult.documentImage
    let imageData = imgObj.pngData()! as NSData
    let base64 = imageData.base64EncodedString(options: .lineLength64Characters)
    let mockData:NSDictionary = ["selfieID":base64]
    if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate{
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        pressScan.scanButton = 0
        pressSelfie.scanButton = 0
        appDelegate.navigateToRN("SELFIE", mockData, nil)
      }
    }
  }
  
    @IBOutlet weak var Selfie: QKMRZScannerViewMy!
    
    
  override func viewDidLoad() {
      super.viewDidLoad()
    Selfie.delegate = self
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    Selfie.startScanning()
    self.navigationController?.setNavigationBarHidden(true, animated: true)
    
}

    @IBAction func SaveSelfie(_ sender: Any) {
        pressScan.scanButton = 1
    }
    override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(true)
        Selfie.stopScanning()
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    
}
}
