//
//  BaseWireframe.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 27/03/2018.
//  Copyright © 2018 GCoelho. All rights reserved.
//

import UIKit

class KamuBaseWireframe {
  
  weak var navigationController: UINavigationController!

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func show(viewController: UIViewController, with transition: Transition, animated: Bool) {
    switch transition {
      
    case .push:
      navigationController.pushViewController(viewController, animated: animated)
      
    case .root:
      navigationController.setViewControllers([viewController], animated: animated)
      
    case .stack(let viewControllers):
      let stack = viewControllers + [viewController]
      navigationController.setViewControllers(stack, animated: animated)
    
    }
  }

}

extension KamuBaseWireframe {
  
  ///Presents a UIAlertController with a prefedined error message
  func presentAlertWith(title:String, desc:String) {
    if let vc = navigationController.presentedViewController {
      
      let alertController = UIAlertController(title:title,
                                              message: desc,
                                              preferredStyle: .alert)
      
      let okayAction = UIAlertAction(title: "", style: .default, handler: nil)
      alertController.addAction(okayAction)
      
      vc.present(alertController, animated: true, completion: nil)
    }
  }
  
}

extension KamuBaseWireframe: WireframeInterface {
  
  func popToRoot(_ animated: Bool) {
    _ = navigationController.popToRootViewController(animated: animated)
  }
  
  func popToViewController(viewController: UIViewController, animated: Bool) {
    _ = navigationController.popToViewController(viewController, animated: animated)
  }
  
  func popFromNavigationController(animated: Bool) {
    _ = navigationController.popViewController(animated: animated)
  }
  
  func dismiss(animated: Bool) {
    if navigationController != nil {
      navigationController.dismiss(animated: animated)
    }
  }
  
}
