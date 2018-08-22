//
//  LibrariesWireframe.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 13/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//
//

import UIKit

final class LibrariesWireframe: BaseWireframe {
  
  // MARK: - Private properties -
  
  // MARK: - Module setup -
  
  func configureModule(with viewController: LibrariesViewController) {
    
    let librariesRepository: KamuLibraryRepository = KamuLibraryRepository(realm: KamuDataBase.shared.getRealmDB())
    let librariesInteractor: RetrieveLibrariesInteractor = RetrieveLibrariesInteractor(repository: librariesRepository)
    
    let presenter = LibrariesPresenter(wireframe: self,
                                       view: viewController,
                                       librariesInteractor: librariesInteractor)
    
    librariesInteractor.response = presenter
    viewController.presenter = presenter
  }
  
  // MARK: - Transitions -
  
  func show(with transition: Transition, animated: Bool = true) {

    let moduleViewController = LibrariesViewController(nibName: nil, bundle: nil)
    configureModule(with: moduleViewController)
    
    show(viewController: moduleViewController, with: transition, animated: animated)
  }
  
  // MARK: - Private Routing -

  private func goBack() {
    
  }
  
  private func goToLib(library: KamuLibrary) {
    let tabModule = KamuTabBarWireframe(navigationController: navigationController)
    tabModule.show(with: .push, index: 0)
  }
  
}

// MARK: - Extensions -

extension LibrariesWireframe: LibrariesWireframeInterface {
  
  func navigate(to option: LibrariesNavigationOption) {
    switch option {
      
    case .back:
      goBack()
       
    case .goToLibrary(let lib):
      goToLib(library: lib)
    }
    
  }
}
