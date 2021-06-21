
import Foundation
import QKMRZParser

public class QKMRZScanResultMy {
    public let documentImage: UIImage
    
    public lazy fileprivate(set) var faceImage: UIImage? = {
        guard let documentImage = CIImage(image: documentImage) else {
            return nil
        }
        
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: CIContext.shared, options: [CIDetectorAccuracy: CIDetectorAccuracyLow])!
        
        guard let face = faceDetector.features(in: documentImage).first else {
            return nil
        }
        
        let increasedFaceBounds = face.bounds.insetBy(dx: -30, dy: -85).offsetBy(dx: 0, dy: 50)
        let faceImage = documentImage.cropped(to: increasedFaceBounds)
        
        guard let cgImage = CIContext.shared.createCGImage(faceImage, from: faceImage.extent) else {
            return nil
        }
        
        return UIImage(cgImage: cgImage)
    }()
    
    init(documentImage image: UIImage) {
        documentImage = image
    }
}
