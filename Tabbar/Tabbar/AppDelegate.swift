//
//  AppDelegate.swift
//  Tabbar
//
//  Created by Khoa Vo T.A. on 3/1/20.
//  Copyright © 2020 Khoa Vo.T.A. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configWindow()
        return true
    }

    private func configWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let vc = TabBarController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}
