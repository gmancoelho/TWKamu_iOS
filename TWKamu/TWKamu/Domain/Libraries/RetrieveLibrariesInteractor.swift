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
  weak var response: RetrieveLibrariesInteractorReponse!
  
  // MARK: - Init

  init(repository: LibraryRepository) {
    self.repository = repository
  }
  
}

extension RetrieveLibrariesInteractor: RetrieveLibrariesInteractorInterface {
  
  func getLibraries() {
    let libraries = repository.getAll()
    
    response.getLibrariesSuccess(libraries: libraries)
  }
  
}
