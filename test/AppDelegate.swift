//
//  AppDelegate.swift
//  test
//
//  Created by shoji on 2017/03/25.
//  Copyright © 2017年 shoji fujita. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var debugWindow: DebugWindow?
  
  func applicationDidFinishLaunching(_ application: UIApplication) {
    print("documentPath：", AppUtil.documentPath().absoluteString)
  }
  
  func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    let customUrlScheme = Constant.CustomUrlScheme(rawValue: url.absoluteString)!
    switch customUrlScheme {
    case .debugDevice:
      showDebugWindow()
    }
    return true
  }
}

extension AppDelegate {
  
  func showDebugWindow() {
    self.debugWindow = DebugWindow(frame: CGRect(x: 100, y: 100, width: 250, height: 150))
    self.debugWindow?.makeKeyAndVisible()
    self.window?.makeKey()
    
    let vc = UIStoryboard(name: "DebugViewController", bundle: nil).instantiateInitialViewController()
    self.debugWindow?.rootViewController = vc
  }
}
