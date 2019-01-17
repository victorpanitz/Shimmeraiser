//
//  ViewController.swift
//  Shimmeraiser
//
//  Created by Victor Panitz Magalhães on 01/14/2019.
//  Copyright (c) 2019 Victor Panitz Magalhães. All rights reserved.
//

import UIKit
import Shimmeraiser

internal class DummyShimmerable: Shimmerable {
    func getSettings() -> ShimmerSettings {
        return ShimmerSettings()
    }
    
    func getPath(containerRect: CGRect) -> CGPath {
        let baseDistance: CGFloat = 208
        let builder = ShimmerPathBuilder()

        builder.appendRectPath(cornerRadius: 3, from:
            CGRect(x: 54, y: baseDistance, width: 129, height: 18),
                               CGRect(x: 54, y: baseDistance + 56, width: containerRect.width-108, height: 3),
                               CGRect(x: 54, y: baseDistance + 89, width: 250, height: 18),
                               CGRect(x: 32, y: baseDistance + 209, width: containerRect.width-64, height: 1)
        )
        
        (0..<2).forEach { i in
            let factor = CGFloat(i)*97
            let yValue: CGFloat = 448
            
            builder.appendOvalPath(from:
                CGRect(x: 41, y: yValue + factor + 21, width: 24, height: 24)
            )
            builder.appendRectPath(cornerRadius: 3, from:
                CGRect(x: 92, y: yValue + factor, width: 122, height: 18),
                                   CGRect(x: 92, y: yValue + factor + 28, width: 122, height: 18),
                                   CGRect(x: 92, y: yValue + factor + 56, width: 122, height: 18),
                                   CGRect(x: containerRect.width-74, y: yValue + factor + 21, width: 44, height: 18),
                                   CGRect(x: 52, y: yValue + 57 + factor, width: 1, height: 18)
            )
        }
        
        return builder.makeMaskPath()
    }
    
}
