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
        
        builder.appendList(
            itensCount: 5,
            xOffset: 0,
            yOffset: 190,
            shapes:
            .oval(frame: CGRect(x: 35, y: 271, width: 40, height: 40)),
            .rect(cornerRadius: 2, rect: CGRect(x: 92, y: 250, width: 280, height: 90)),
            .rect(cornerRadius: 2, rect: CGRect(x: 92, y: 350, width: 280, height: 18)),
            .rect(cornerRadius: 2, rect: CGRect(x: 92, y: 378, width: 122, height: 18))
        )
        
        return builder.makeMaskPath()
    }
}
