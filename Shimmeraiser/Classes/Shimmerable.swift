//
//  ShimmeraiserBuilder.swift
//  Shimmeraiser
//
//  Created by Victor on future.
//

import UIKit

public protocol Shimmerable: class {
    func getSettings() -> ShimmerSettings
    func getPath(containerRect: CGRect) -> CGPath
}
