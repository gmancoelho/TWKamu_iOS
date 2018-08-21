//
//  KamuNavigationController.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 10/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

class KamuNavigationController: UINavigationController {
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureTheme()
  }
  
  // MARK: - Class Configuration

  private func configureTheme() {
    
    self.navigationBar.backgroundColor = KamuColors.plaeGrey
    
    self.navigationBar.tintColor = KamuColors.red
    self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: KamuColors.black]
    
    if #available(iOS 11.0, *) {
      self.navigationBar.prefersLargeTitles = true
      self.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: KamuColors.black]
    }
  }
  
  // MARK: - Private
  override open var childViewControllerForStatusBarStyle: UIViewController? {
    return self.topViewController
  }
  
  // MARK: - Navigation
  
  override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    super.pushViewController(viewController, animated: animated)
    styleViewController(viewController: viewController)
  }
  
  override func popViewController(animated: Bool) -> UIViewController? {
    let destinationVC = viewControllers.dropLast().last
    let poped = super.popViewController(animated: animated)
    styleViewController(viewController: destinationVC)
    return poped
  }
  
  override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
    let poped = super.popToViewController(viewController, animated: animated)
    styleViewController(viewController: viewController)
    return poped
  }
  
  override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
    super.setViewControllers(viewControllers, animated: animated)
    _ = viewControllers.map({ styleViewController(viewController: $0) })
  }
  
  // MARK: - Styling
  
  private func removeNavigationImage() {
    navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    navigationBar.shadowImage = UIImage()
  }
  
  private func hiddenNavigation(_ hidden: Bool) {
    self.setNavigationBarHidden(hidden, animated: true)
  }
  
  private func styleViewController(viewController: UIViewController?) {
    
    if let vc = viewController as? Themeable {
      switch vc {
        
      case is KamuClearNavigationBarTheme:
        
        hiddenNavigation(true)
        removeNavigationImage()
        
      default:
        hiddenNavigation(false)

      }
    } else {
      hiddenNavigation(false)
    }
  }
  
}
