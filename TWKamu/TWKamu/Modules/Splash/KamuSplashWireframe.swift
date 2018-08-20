//
//  KamuSplashWireframe.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 20/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

final class KamuSplashWireframe: BaseWireframe {
  
  // MARK: - Private properties -
  
  // MARK: - Module setup -
  
  func configureModule(with viewController: KamuSplashViewController) {
    
    let presenter = KamuSplashPresenter(wireframe: self, view: viewController)
    viewController.presenter = presenter
  }
  
  // MARK: - Transitions -
  
  func show(with transition: Transition, animated: Bool = true) {
    
    let moduleViewController = KamuSplashViewController(nibName: nil, bundle: nil)
    
    configureModule(with: moduleViewController)
    
    show(viewController: moduleViewController, with: transition, animated: animated)
  }
  
  // MARK: - Private Routing -
  
  private func createHomeModule() {
    let homeModule = HomeWireframe(navigationController: navigationController)
    homeModule.show(with: .root)
  }
  
}

// MARK: - Extensions -

extension KamuSplashWireframe: KamuSplashWireframeInterface {
  
  func navigate(to option: KamuSplashNavigationOption) {
    switch option {
      
    case .goToHome:
      createHomeModule()
      
    }
  }
}
