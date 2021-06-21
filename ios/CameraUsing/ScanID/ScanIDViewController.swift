
import Foundation
struct pressScan {
  static var scanButton: Int! = 0
}

class ScanIDViewController: UIViewController, QKMRZScannerViewDelegateMy {
  
  func mrzScannerView(_ mrzScannerView: QKMRZScannerViewMy, didFind scanResult: QKMRZScanResultMy) {
    let imgObj =  scanResult.documentImage
    let imageData = imgObj.pngData()! as NSData
    let base64 = imageData.base64EncodedString(options: .lineLength64Characters)
    
    let mockData:NSDictionary = ["scanID":base64]
    if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate{
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        pressScan.scanButton = 0
        appDelegate.navigateToRN("SCANID", mockData, nil)
      }
      
    }
  }
  
  
    @IBOutlet weak var mrzScanID: QKMRZScannerViewMy!
    
  override func viewDidLoad() {
      super.viewDidLoad()
    mrzScanID.delegate = self
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    mrzScanID.startScanning()
    self.navigationController?.setNavigationBarHidden(true, animated: true)
    
}

    @IBAction func SaveID(_ sender: Any) {
      pressScan.scanButton = 1
      
    }
    override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(true)
      mrzScanID.stopScanning()
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    
}
}
