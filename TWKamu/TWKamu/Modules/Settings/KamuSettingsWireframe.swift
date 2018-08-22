//
//  KamuSettingsWireframe.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 22/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//
//

import UIKit

final class KamuSettingsWireframe: BaseWireframe {
  
  // MARK: - Private properties -
  
  // MARK: - Private properties -
  
  let viewController = KamuSettingsViewController(nibName: nil, bundle: nil)
  
  // MARK: - Module setup -
  
  func configureModule() -> KamuSettingsViewController {
    
    let presenter = KamuSettingsPresenter(wireframe: self, view: viewController)
    viewController.presenter = presenter
    
    return viewController
  }
  
  // MARK: - Transitions -
  
  // MARK: - Private Routing -

  func goToHomeModule() {
    let homeModule = HomeWireframe(navigationController: navigationController)
    homeModule.show(with: .root)
  }
  
}

// MARK: - Extensions -

extension KamuSettingsWireframe: KamuSettingsWireframeInterface {
  
  func navigate(to option: KamuSettingsNavigationOption) {
    switch option {
      
    case .goToHome:
      goToHomeModule()
      
    }
  }
}
