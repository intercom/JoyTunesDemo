//
//  AppDelegate.swift
//  JoyTunesDemo
//
//  Created by Brian Boyle on 26/01/2022.
//

import UIKit
import Intercom

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var intercomIsOpen: Bool = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NotificationCenter.default.addObserver(self, selector: #selector(intercomDidShow),
                                               name: NSNotification.Name.IntercomWindowDidShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(intercomDidHide),
                                               name: NSNotification.Name.IntercomWindowDidHide,
                                               object: nil)
        Intercom.setApiKey("YOUR_API_KEY", forAppId: "YOUR_APP_ID")
        Intercom.registerUnidentifiedUser()
        return true
    }

    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if intercomIsOpen {
            return .all
        }
        return .landscape
    }

    @objc
    func intercomDidShow() {
        intercomIsOpen = true
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
    }
    
    @objc
    func intercomDidHide() {
        intercomIsOpen = false
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
    }
}

