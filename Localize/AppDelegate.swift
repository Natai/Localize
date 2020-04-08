//
//  AppDelegate.swift
//
//  Created by natai on 2020/4/7.
//  
//  Copyright © 2020 bibr. All rights reserved.
//
    

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    override init() {
        super.init()
        Bundle.swizzlingLocalize()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NotificationCenter.default.addObserver(self, selector: #selector(setWindowRootController), name: Notification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController(rootViewController: RootViewController())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }
    
    @objc private func setWindowRootController() {
        let root = RootViewController()
        root.title = NSLocalizedString("根视图", comment: "根视图")
        let first = FirstViewController()
        first.title = NSLocalizedString("排行%d视图", comment: "第几个视图").localizedFormat(1)
        let second = SecondViewController()
        let nav = UINavigationController(rootViewController: root)
        window?.rootViewController = nav
        // nav.setViewControllers 方式状态栏会闪动
        nav.pushViewController(first, animated: false)
        nav.pushViewController(second, animated: false)
    }
}

