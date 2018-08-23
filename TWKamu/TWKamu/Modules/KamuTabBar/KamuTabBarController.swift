//
//  KamuTabBarController.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 22/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

class KamuTabBarController: UITabBarController {
  
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
    self.title = KamuStrings.Labels.explore_title
  }
  
  override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    
    if item.tag == 0 {
      self.title = KamuStrings.Labels.explore_title
    } else {
      self.title = KamuStrings.Labels.settings_title
    }
  }
}
