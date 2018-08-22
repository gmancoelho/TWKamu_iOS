//
//  KamuTabBarWireframe.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 22/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

final class KamuTabBarWireframe: BaseWireframe {
  
  // MARK: - Private properties -
  
  let tabBar = KamuTabBarController()
  var viewControllers:[UIViewController] = []
  
  // MARK: - Module setup -
  
  private func configureModuleTabBar() {
    
    tabBar.viewControllers = [setUpExploreModule(), setUpSettingsModule()]
    
  }
  
  private func setUpExploreModule() -> UIViewController {
    
    let exploreWireFrame = KamuExploreWireframe(navigationController: navigationController)
    
    let exploreViewController = exploreWireFrame.configureModule()
    exploreWireFrame.tabBarController = tabBar
    
    exploreViewController.tabBarItem = KamuTabItens.explore.tabItens
    
    return exploreViewController
  }
  
  private func setUpSettingsModule() -> UIViewController {
    
    let settingsWireFrame = KamuSettingsWireframe(navigationController: navigationController)
    
    let settingsViewController = settingsWireFrame.configureModule()
    settingsWireFrame.tabBarController = tabBar
    
    settingsViewController.tabBarItem = KamuTabItens.settings.tabItens
    
    return settingsViewController
  }
  
  // MARK: - Transitions -
  
  func show(with transition: Transition, animated: Bool = true, index:Int) {
    
    configureModuleTabBar()
    
    tabBar.selectedIndex = index
    
    self.tabBarController = tabBar
    
    if let tab = self.tabBarController {
      self.navigationController.present(tab, animated: true)
    }
    
  }
//  
//  func show(parentVC: UIViewController, transition: Transition, animated:Bool = true) {
//    configureModule(with: moduleViewController)
//    show(moduleViewController,
//         with: .createNavFrom(fromViewController: parentVC),
//         animated: true)
//  }
//  
  // MARK: - Private Routing -
  
  private func selectedIndex(index:Int) {
    tabBar.selectedIndex = index
  }
  
}

// MARK: - Extensions -

extension KamuTabBarWireframe: KamuTabBarWireframeInterface {
  
  func navigate(to option: KamuTabBarNavigationOption) {
    switch option {
      
    case .selectedExplore:
      selectedIndex(index: 0)
      
    case .selectedMyBooks:
      selectedIndex(index: 1)
      
    case .selectedWishlist:
      selectedIndex(index: 2)
      
    case .selectedSettings:
      selectedIndex(index: 2)
      
    }
  }
}
