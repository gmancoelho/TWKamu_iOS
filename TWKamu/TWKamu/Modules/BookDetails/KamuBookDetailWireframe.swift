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
  
  let moduleViewController = KamuBookDetailViewController(nibName: nil, bundle: nil)

  // MARK: - Module setup -
  
  func configureModule(book: KamuBook) {
    
    let presenter = KamuBookDetailPresenter(wireframe: self, view: moduleViewController, book: book)
    moduleViewController.presenter = presenter
  }
  
  // MARK: - Transitions -
  
  func show(parentVC: UIViewController, transition: Transition, animated:Bool = true, book: KamuBook) {
    
    configureModule(book: book)
    
    show(viewController: moduleViewController,
         with: .createNavFrom(fromViewController: parentVC),
         animated: true)
  }
  
  // MARK: - Private Routing -

}

// MARK: - Extensions -

extension KamuBookDetailWireframe: KamuBookDetailWireframeInterface {
  
  func navigate(to option: KamuBookDetailNavigationOption) {

  }
}
