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
        UIView.swizzlingInterfaceCallback()
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
        root.title = NSLocalizedString("视图%d", comment: "第1个视图").localizedFormat(1)
        let first = FirstViewController()
        first.title = NSLocalizedString("视图%d", comment: "第1个视图").localizedFormat(2)
        let second = SecondViewController()
        let nav = UINavigationController(rootViewController: root)
        window?.rootViewController = nav
        // nav.setViewControllers 方式状态栏会闪动
        nav.pushViewController(first, animated: false)
        nav.pushViewController(second, animated: false)
    }
}

