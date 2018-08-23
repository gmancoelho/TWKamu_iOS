//
//  KamuBookDetailWireframe.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 23/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//
//

import UIKit

final class KamuBookDetailWireframe: BaseWireframe {
  
  // MARK: - Private properties -
  
  // MARK: - Module setup -
  
  func configureModule(with viewController: KamuBookDetailViewController, book: KamuBook) {
    
    let presenter = KamuBookDetailPresenter(wireframe: self, view: viewController, book: book)
    viewController.presenter = presenter
  }
  
  // MARK: - Transitions -
  
  func show(with transition: Transition, animated: Bool = true, book: KamuBook) {

    let moduleViewController = KamuBookDetailViewController(nibName: nil, bundle: nil)
    
    configureModule(with: moduleViewController, book: book)
    
    show(viewController: moduleViewController, with: transition, animated: animated)
  }
  
  // MARK: - Private Routing -

}

// MARK: - Extensions -

extension KamuBookDetailWireframe: KamuBookDetailWireframeInterface {
  
  func navigate(to option: KamuBookDetailNavigationOption) {

  }
}
