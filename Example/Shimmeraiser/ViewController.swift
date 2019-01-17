//
//  ViewController.swift
//  Shimmeraiser
//
//  Created by Victor Panitz Magalhães on 01/14/2019.
//  Copyright (c) 2019 Victor Panitz Magalhães. All rights reserved.
//

import UIKit
import Shimmeraiser

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(showShimmer), userInfo: nil, repeats: true)
//        Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(removeShimmer), userInfo: nil, repeats: true)

    }

    @objc private func showShimmer() {
        Shimmer.show(MyCustomShimmer(), in: self)
    }
    
    @objc func removeShimmer() {
        Shimmer.hide()
    }
}



