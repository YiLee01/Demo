//
//  Appdelegate.swift
//  demo
//
//  Created by YL on 2023/12/25.
//

import UIKit
import Foundation

@main
class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let vc = ViewController()
        let nav = UINavigationController(rootViewController: vc)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }
}
