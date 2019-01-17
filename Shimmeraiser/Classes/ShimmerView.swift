import UIKit
import Foundation

class ShimmerView: UIView {
    
    private let containerView: UIView
    private let startColor: UIColor
    private let endColor: UIColor
    private let percentageWidth: CGFloat
    private let duration: Double
    private let autoreverses: Bool
    
    private enum Sort {
        case forward, reverse
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    internal init(containerView: UIView, shimmerable: Shimmerable) {
        self.containerView = containerView
        
        let settings = shimmerable.getSettings()
        self.startColor = settings.startColor
        self.endColor = settings.endColor
        self.percentageWidth = settings.percentageWidth
        self.duration = settings.duration
        self.autoreverses = settings.autoreverses
        
        super.init(frame: containerView.frame)
        
        self.layer.mask = mask(
            from: shimmerable.getPath(containerRect: frame),
            with: frame
        )
        
        self.setupAnimation()
    }
    
    internal func animate() {
        UIView.transition(
            with: containerView,
            duration: 0.2,
            options: [.curveEaseOut],
            animations: {
                DispatchQueue.main.async {
                    self.containerView.addSubview(self)
                }
        },
            completion: nil
        )
    }
    
    internal func stopAnimation() {
        UIView.transition(
            with: self,
            duration: 0.2,
            options: [.curveEaseOut],
            animations: {
                self.alpha = 0.0
        }) { _ in
            DispatchQueue.main.async {
                self.removeFromSuperview()
            }
        }
    }
    
    private func mask(from path: CGPath, with rect: CGRect) -> CAShapeLayer {
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = rect
        maskLayer.path = path
        return maskLayer
    }
    
    private func setupAnimation() {
        self.clipsToBounds = true
        
        let baseLayer = generateBaseLayer(frame: self.frame)
        let gradientLayer = gradientGenerator(frame: baseLayer.bounds)
        
        baseLayer.addSublayer(gradientLayer)
        self.layer.addSublayer(baseLayer)
        
        let animation = generateAnimation(over: baseLayer)
        gradientLayer.add(animation, forKey: "shimmer")
    }
    
    private func generateBaseLayer(frame: CGRect) -> CALayer {
        let layer = CALayer()
        layer.frame = frame
        layer.backgroundColor = startColor.cgColor
        layer.cornerRadius = 2
        layer.masksToBounds = true
        
        return layer
    }
    
    private func gradientGenerator(frame: CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors =
            generateColors(from: startColor, step: 5, sort: .reverse) +
            generateColors(from: endColor, step: 2, sort: .forward) +
            generateColors(from: endColor, step: 2, sort: .reverse) +
            generateColors(from: startColor, step: 5, sort: .forward)
        
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.frame = CGRect(
            x: frame.origin.x,
            y: frame.origin.y,
            width: frame.width*percentageWidth,
            height: frame.height
        )
        
        return gradientLayer
    }
    
    private func generateAnimation(over layer: CALayer) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = duration
        animation.fromValue = layer.frame.origin.x - layer.frame.width
        animation.toValue = layer.frame.origin.x + layer.frame.width
        animation.repeatCount = .infinity
        animation.autoreverses = autoreverses
        animation.isRemovedOnCompletion = false
        
        return animation
    }
    
    private func generateColors(from color: UIColor, step: Int, sort: Sort) -> [CGColor] {
        var colors = [CGColor]()
        
        stride(from: 2, through: 10, by: step).forEach { i in
            colors.append((color.withAlphaComponent(round(CGFloat(i) * 0.1 * 100)/100)).cgColor)
        }
        
        return sort == .forward
            ? colors
            : colors.reversed()
    }

}
