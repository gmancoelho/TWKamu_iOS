//
//  KamuExploreWireframe.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 21/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//
//

import UIKit

final class KamuExploreWireframe: BaseWireframe {
  
  // MARK: - Private properties -
  
  // MARK: - Module setup -
  
  func configureModule(with viewController: KamuExploreViewController) {
    
    let presenter = KamuExplorePresenter(wireframe: self, view: viewController)
    viewController.presenter = presenter
  }
  
  // MARK: - Transitions -
  
  func show(with transition: Transition, animated: Bool = true) {

    let moduleViewController = KamuExploreViewController(nibName: nil, bundle: nil)
    
    configureModule(with: moduleViewController)
    
    show(viewController: moduleViewController, with: transition, animated: animated)
  }
  
  // MARK: - Private Routing -

  private func backToOfficeModule() {

  }
  
  private func createDetailModule() {
    
  }
}

// MARK: - Extensions -

extension KamuExploreWireframe: KamuExploreWireframeInterface {
  
  func navigate(to option: KamuExploreNavigationOption) {
    switch option {
      
    case .back:
      backToOfficeModule()
      
    case .goToDetail:
      createDetailModule()
    }
  }
}
