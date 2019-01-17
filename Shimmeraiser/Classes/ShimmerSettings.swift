import Foundation

public struct ShimmerSettings {
    public var startColor: UIColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    public var endColor: UIColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    public var percentageWidth: CGFloat = 1
    public var duration: Double = 2
    public var autoreverses: Bool = true
    
    public init(startColor: UIColor, endColor: UIColor, percentageWidth: CGFloat, duration: Double, autoreverses: Bool) {
        self.startColor = startColor
        self.endColor = endColor
        self.percentageWidth = percentageWidth
        self.duration = duration
        self.autoreverses = autoreverses
    }
    
    public init() {}
}
