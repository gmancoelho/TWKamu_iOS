//
//  WireframeInterfaces.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 10/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

enum Transition {
  
  case root
  case push
  case stack(viewControllers: [UIViewController])
  
}

protocol WireframeInterface: class {
  func popToViewController(viewController: UIViewController, animated: Bool)
  func popFromNavigationController(animated: Bool)
  func dismiss(animated: Bool)
}
