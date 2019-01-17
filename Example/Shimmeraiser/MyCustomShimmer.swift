//
//  ViewController.swift
//  Shimmeraiser
//
//  Created by Victor Panitz Magalhães on 01/14/2019.
//  Copyright (c) 2019 Victor Panitz Magalhães. All rights reserved.
//

import UIKit
import Shimmeraiser

final class MyCustomShimmer: Shimmerable {
    func getSettings() -> ShimmerSettings {
        return ShimmerSettings()
    }

    func getPath(containerRect: CGRect) -> CGPath {
        let builder = ShimmerPathBuilder()
        
        builder.appendRectPath(cornerRadius: 3, from:
            CGRect(x: 38, y: 90, width: 337, height: 130)
            )
        
        (0..<5).forEach { i in
            let factor = CGFloat(i)*190
            let yValue: CGFloat = 250
            
            builder.appendOvalPath(from:
                CGRect(x: 35, y: yValue + factor + 21, width: 40, height: 40)
            )
            builder.appendRectPath(cornerRadius: 3, from:
                CGRect(x: 92, y: yValue + factor, width: 280, height: 90),
                CGRect(x: 92, y: yValue + factor + 100, width: 280, height: 18),
                CGRect(x: 92, y: yValue + factor + 128, width: 122, height: 18)
            )
        }
        
        return builder.makeMaskPath()
    }
}
