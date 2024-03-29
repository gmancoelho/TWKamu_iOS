//
//  KamuApplicationRouter.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 10/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit
import RealmSwift

final class KamuApplicationRouter {
  
  // MARK: - Properties
  
  let window:UIWindow
  let baseNavigationController: KamuNavigationController = KamuNavigationController()
  
  // MARK: - Database
  
  // MARK: - Init
  
  init(window: UIWindow) {
    
    self.window = window
    
    window.rootViewController = baseNavigationController
    window.backgroundColor = UIColor.white
    window.makeKeyAndVisible()
  }
  
  // MARK: - Router
  
  func initRouter() {
    let splashModule = KamuSplashWireframe(navigationController: baseNavigationController)
    splashModule.show(with: .root)
  }
  
  // MARK: - Private Methods
  
}
