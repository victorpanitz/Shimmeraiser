//
//  ShimmeraiserBuilder.swift
//  Shimmeraiser
//
//  Created by Victor on future.
//

import Foundation

public class ShimmerPathBuilder {
    
    public init(){}
    
    internal lazy var path = UIBezierPath()
    
    public enum Shape {
        case oval(frame: CGRect)
        case rect(cornerRadius: CGFloat, rect: CGRect)
    }
    
    public func appendRectPath(
        cornerRadius: CGFloat = 0,
        from frames: CGRect...) {
        frames
            .map { UIBezierPath(roundedRect: $0, cornerRadius: cornerRadius) }
            .forEach (path.append(_:))
    }
    
    public func appendOvalPath(from frames: CGRect...) {
        frames
            .map { UIBezierPath(ovalIn: $0) }
            .forEach (path.append(_:))
    }
    
    public func appendList(itensCount: Int = 1, xOffset: CGFloat = 0, yOffset: CGFloat = 0, shapes: Shape...) {
       
        (0..<max(1, itensCount)).forEach {
            
            let xSeparator = CGFloat($0) * xOffset
            let ySeparator = CGFloat($0) * yOffset
            
            shapes.map {
                switch $0 {
                case .oval(let rect):
                    return UIBezierPath(
                        ovalIn: CGRect(
                            x: rect.origin.x + xSeparator,
                            y: rect.origin.y + ySeparator,
                            width: rect.width,
                            height: rect.height
                        )
                    )
                    
                case .rect(let cornerRadius, let rect):
                    return UIBezierPath(
                        roundedRect: CGRect(
                            x: rect.origin.x + xSeparator,
                            y: rect.origin.y + ySeparator,
                            width: rect.width,
                            height: rect.height
                        ),
                        cornerRadius: cornerRadius
                    )
                }
            }.forEach (path.append(_:))
            
        }
    }
    
    public func makeMaskPath() -> CGPath {
        return path.cgPath
    }
}
