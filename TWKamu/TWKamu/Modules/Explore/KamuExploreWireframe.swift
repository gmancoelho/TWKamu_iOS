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
  
  let viewController = KamuExploreViewController(nibName: nil, bundle: nil)
  
  // MARK: - Module setup -
  
  func configureModule() -> KamuExploreViewController {
  
    let booksRepository: KamuBookRepository = KamuBookRepository(realm: KamuDataBase.shared.getRealmDB())
    let booksInteractor: KamuBooksInteractor = KamuBooksInteractor(repository: booksRepository)
    
    let presenter = KamuExplorePresenter(wireframe: self,
                                         view: viewController,
                                         booksInteractor: booksInteractor)
    booksInteractor.response = presenter
    viewController.presenter = presenter
    
    return viewController
  }
  
  // MARK: - Transitions -
  
  // MARK: - Private Routing -

  private func backToOfficeModule() {

  }
  
  private func createDetailModule(book: KamuBook) {
    let detailModule = KamuBookDetailWireframe(navigationController: navigationController)
    detailModule.show(parentVC: self.viewController, transition: .push, book: book)
  }
}

// MARK: - Extensions -

extension KamuExploreWireframe: KamuExploreWireframeInterface {
  
  func navigate(to option: KamuExploreNavigationOption) {
    switch option {
      
    case .back:
      backToOfficeModule()
      
    case .goToDetail(let book):
      createDetailModule(book: book)
    }
  }
}
