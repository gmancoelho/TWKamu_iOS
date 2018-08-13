//
//  HomeWireframe.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 13/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//
//

import UIKit

final class HomeWireframe: BaseWireframe {
  
  // MARK: - Private properties -
  
  // MARK: - Module setup -
  
  func configureModule(with viewController: HomeViewController) {
    
    let presenter = HomePresenter(wireframe: self, view: viewController)
    viewController.presenter = presenter
  }
  
  // MARK: - Transitions -
  
  func show(with transition: Transition, animated: Bool = true) {

    let moduleViewController = HomeViewController(nibName: nil, bundle: nil)
    
    configureModule(with: moduleViewController)
    
    show(viewController: moduleViewController, with: transition, animated: animated)
  }
  
  // MARK: - Private Routing -

  private func createLibraryModule() {
    
    
  }
  
}

// MARK: - Extensions -

extension HomeWireframe: HomeWireframeInterface {
  
  func navigate(to option: HomeNavigationOption) {
    switch option {
    case .goToLibraries:
      createLibraryModule()
      
    }
  }
}
