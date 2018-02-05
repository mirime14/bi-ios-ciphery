//
//  AppDelegate.swift
//  BI-IOS
//
//  Created by Jan Misar on 09.10.17.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import UIKit
import MagicalRecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        UINavigationBar.appearance().barTintColor = UIColor(rgb: 0x1768AC)
        UITabBar.appearance().barTintColor = UIColor(rgb: 0x1768AC)
        UINavigationBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = .white
        
        let attrs = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont(name: "AvenirNextCondensed-DemiBold", size: 24)!
        ]
        
        UINavigationBar.appearance().titleTextAttributes = attrs
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let menuController = UINavigationController(rootViewController: MenuViewController())
        menuController.tabBarItem.title = "menu"
        menuController.tabBarItem.image = #imageLiteral(resourceName: "settings")
        menuController.title = "menu"
        
        let TTCController = TexttoCipherController()
        TTCController.tabBarItem.title = "text -> cipher"
        TTCController.tabBarItem.image = #imageLiteral(resourceName: "lock")
        TTCController.title = "text -> cipher"
        
        let CTTController = CiphertoTextController()
        CTTController.tabBarItem.title = "cipher -> text"
        CTTController.tabBarItem.image = #imageLiteral(resourceName: "unlock")
        CTTController.title = "cipher -> text"
        
        let MorseCodeController = UINavigationController(rootViewController: MorseCodeEncryptController())
        MorseCodeController.title = "Encrypt to Morse code"
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [menuController]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

