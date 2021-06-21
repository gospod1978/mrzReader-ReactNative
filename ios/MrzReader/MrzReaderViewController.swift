
import Foundation
import QKMRZScanner

class MrzReaderViewController: UIViewController, QKMRZScannerViewDelegate {
  
  func mrzScannerView(_ mrzScannerView: QKMRZScannerView, didFind scanResult: QKMRZScanResult) {
    
    let imgObj =  scanResult.documentImage
    let imageData = imgObj.pngData()! as NSData
    let base64 = imageData.base64EncodedString(options: .lineLength64Characters)
    let dataFormater = DateFormatter()
    dataFormater.dateFormat = "dd/MM/YYYY"
    let birthDate = dataFormater.string(from: scanResult.birthDate!)
    let expiryDate = dataFormater.string(from: scanResult.expiryDate!)
    print(base64)
    let mockData:NSDictionary = ["mrz":[scanResult.nationality, scanResult.countryCode, scanResult.documentType, base64, scanResult.documentNumber, scanResult.givenNames, scanResult.personalNumber, scanResult.surnames, birthDate, expiryDate, scanResult.personalNumber2, scanResult.sex]]
    if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate{
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        appDelegate.navigateToRN("MRZ", mockData, nil)
      }
      
    }
  }
  
    @IBAction func MRZBack(_ sender: UIButton) {
      self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var mrzScannerView: QKMRZScannerView!
  
  override func viewDidLoad() {
      super.viewDidLoad()
      mrzScannerView.delegate = self
      
  }

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(true)
      mrzScannerView.startScanning()
      self.navigationController?.setNavigationBarHidden(true, animated: true)
      
  }
  
  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(true)
      mrzScannerView.stopScanning()
      self.navigationController?.setNavigationBarHidden(false, animated: true)
      
  }
  
}
