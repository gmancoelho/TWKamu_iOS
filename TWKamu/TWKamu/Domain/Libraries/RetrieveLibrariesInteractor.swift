//
//  RetrieveLibrariesInteractor.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 16/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

final class RetrieveLibrariesInteractor {
  
  // MARK: - Properties
  
  var repository: LibraryRepository!
  
  // MARK: - Response Delegate
  weak var response: RetrieveLibrariesInteractorReponse?
  
  // MARK: - Init

  init(repository: LibraryRepository) {
    self.repository = repository
    
    _ = repository.create(a: KamuLibrary(cityName:"Teste", id: 1))
    _ = repository.create(a: KamuLibrary(cityName:"Teste1", id: 2))
    _ = repository.create(a: KamuLibrary(cityName:"Teste2", id: 3))
  }
  
}

extension RetrieveLibrariesInteractor: RetrieveLibrariesInteractorInterface {
  
  func getLibraries() {
    
    guard let resp = response else {
      dump("RetrieveLibrariesInteractorReponse is nil")
      return
    }
    
    let libraries = repository.getAll()
    
    resp.getLibrariesSuccess(libraries: libraries)
  }
  
}
