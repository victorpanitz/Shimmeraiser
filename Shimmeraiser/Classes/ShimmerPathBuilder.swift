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
    
    public func makeMaskPath() -> CGPath {
        return path.cgPath
    }
}
