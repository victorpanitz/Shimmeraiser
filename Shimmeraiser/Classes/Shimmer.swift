//
//  Shimmer.swift
//  Shimmeraiser
//
//  Created by Victor on future.
//

import Foundation
import UIKit

public struct Shimmer {
    static var shimmerView: UIView?
    public static var settings: ShimmerSettings = ShimmerSettings()
    
    public static func show(_ shimmerable: Shimmerable, in viewController: UIViewController) {
        guard shimmerView == nil else { return }
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        shimmerView = ShimmerView(containerView: viewController.view, shimmerable: shimmerable)
        (shimmerView as? ShimmerView)?.animate()
    }
    
    public static func hide() {
        guard let view = shimmerView else { return }
        
        UIApplication.shared.endIgnoringInteractionEvents()
        
        (view as? ShimmerView)?.stopAnimation()
        self.shimmerView = nil
    }
}
