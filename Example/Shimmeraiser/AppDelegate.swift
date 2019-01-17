//
//  AppDelegate.swift
//  Shimmeraiser
//
//  Created by Victor Panitz Magalhães on 01/14/2019.
//  Copyright (c) 2019 Victor Panitz Magalhães. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = ViewController()

        return true
    }
}

