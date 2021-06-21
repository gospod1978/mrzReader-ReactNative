
import UIKit

class QKCutoutViewMy: UIView {
    fileprivate(set) var cutoutRect: CGRect!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black.withAlphaComponent(0.45)
        contentMode = .redraw
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        cutoutRect = calculateCutoutRect()
        layer.sublayers?.removeAll()
        drawRectangleCutout()
    }
    
    // MARK: Misc
    fileprivate func drawRectangleCutout() {
        let maskLayer = CAShapeLayer()
        let path = CGMutablePath()
        let cornerRadius = CGFloat(3)
      var cropNumber:CGFloat
      if bounds.height > bounds.width {
        cropNumber = bounds.height * 0.1
      } else {
        cropNumber = bounds.width * 0.1
      }
        if pressSelfie.scanButton == 1 {
          path.addRect(bounds)
          let newBounds = CGRect(x: bounds.minX + cropNumber, y: bounds.minY + cropNumber, width: bounds.width - (cropNumber * 2), height: bounds.height - (cropNumber * 2))
          path.addEllipse(in: newBounds)
        } else {
          path.addRoundedRect(in: cutoutRect, cornerWidth: cornerRadius, cornerHeight: cornerRadius)
          path.addRect(bounds)
        }
      
        
        
        maskLayer.path = path
        maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
        
        layer.mask = maskLayer
        
        // Add border around the cutout
        let borderLayer = CAShapeLayer()
        if pressSelfie.scanButton == 0 {
          borderLayer.path = UIBezierPath(roundedRect: cutoutRect, cornerRadius: cornerRadius).cgPath
          borderLayer.lineWidth = 3
          borderLayer.strokeColor = UIColor.white.cgColor
        }
        borderLayer.frame = bounds
      
        layer.addSublayer(borderLayer)
    }
    
    fileprivate func calculateCutoutRect() -> CGRect {
        var documentFrameRatio = CGFloat(1.42) // Passport's size (ISO/IEC 7810 ID-3) is 125mm × 88mm
        let (width, height): (CGFloat, CGFloat)
        var scale = 0.75
        if pressSelfie.scanButton == 1 {
          scale = 1
          documentFrameRatio = CGFloat(0.9)
        }
        if bounds.height > bounds.width {
            width = (bounds.width * 0.9) // Fill 90% of the width
            height = (width / documentFrameRatio)
        }
        else {
            height = (bounds.height * CGFloat(scale))
            width = (height * documentFrameRatio)
        }
        
        let topOffset = (bounds.height - height) / 2
        let leftOffset = (bounds.width - width) / 2
      
        return CGRect(x: leftOffset, y: topOffset, width: width, height: height)
    }
}
