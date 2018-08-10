//
//  KamuNavigationController.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 10/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit


class KamuNavigationController: UINavigationController {
  
  // MARK: - Properties
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    let defaultBarStyle: UIStatusBarStyle = .lightContent
    if let vc = viewControllers.last as? StatusBarTheme {
      return vc.navigationStatusBarStyle ?? defaultBarStyle
    }
    return defaultBarStyle
  }
  
  // MARK: - Private
  override open var childForStatusBarStyle: UIViewController? {
    return self.topViewController
  }
  
  // MARK: - Private
  
  // MARK: - Lifecycle
  required convenience init() {
    self.init(navigationBarClass: nil, toolbarClass: nil)
    customizeBackButton()
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
  
  private func customizeBackButton() {
    let backArrowImage = UIImage(named: "btn_leftArrowWhite")
    let renderedImage = backArrowImage?.withRenderingMode(.alwaysTemplate)
    UINavigationBar.appearance().backIndicatorImage = renderedImage
    UINavigationBar.appearance().backIndicatorTransitionMaskImage = renderedImage
  }
  
  private func removeNavigationShadow() {
    navigationBar.shadowImage = UIImage()
  }
  
  private func removeNavigationImage() {
    navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    removeNavigationShadow()
  }
  
  private func removeBackButtonTitle(from viewController: UIViewController?) {
    let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    viewController?.navigationItem.backBarButtonItem = item
  }
  
  private func hiddenNavigation(_ hidden: Bool) {
    self.setNavigationBarHidden(hidden, animated: true)
  }
  
  private func styleViewController(viewController: UIViewController?) {
    
    if let vc = viewController as? Themeable {
      switch vc {
        
      case is KamuBlackNavigationBarTheme:
        hiddenNavigation(false)
        removeNavigationImage()
      default:
        break
      }
      
      removeBackButtonTitle(from: viewController)
      navigationBar.barStyle = vc.navigationBarStyle
      navigationBar.isTranslucent = vc.navigationBarTranslucent
      navigationBar.barTintColor = vc.navigationBarBackgroundColor
      navigationBar.tintColor = vc.navigationBarTintColor
      navigationBar.titleTextAttributes = vc.navigationTitleTextAttributes
    }
  }
}
