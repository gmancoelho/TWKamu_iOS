//
//  AppDelegate.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 10/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  // MARK: - Application Delegate
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    initBaseRouter()
    return true
  }
  
  // MARK: - Private Methods
  
  private func initBaseRouter() {
    if let window = window {
      KamuApplicationRouter(window: window).initRouter()
    }
  
  }
}

