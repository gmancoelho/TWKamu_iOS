//
//  KamuTabBarController.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 22/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

class KamuTabBarController: UITabBarController, KamuTabbedControllerInterface {
  
  // MARK: - Lifecycle
  required convenience init() {
    self.init(nibName: nil, bundle: nil)
    
    self.configuration()
  }
  
  // MARK: - Configuration
  
  private func configuration() {
    
    self.tabBar.barTintColor = KamuColors.navColor
    self.tabBar.tintColor = KamuColors.red
    self.tabBar.unselectedItemTintColor = KamuColors.steel
    
    if let nav = navigationController {
      nav.navigationBar.barStyle = .blackTranslucent
    }
    
  }
  
  func selectedIndex(index: Int) {
    
    self.selectedIndex = index
  }
  
}
