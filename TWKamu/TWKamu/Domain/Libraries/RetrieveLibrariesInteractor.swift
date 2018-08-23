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
  
  var repository: KamuLibraryRepository!
  
  // MARK: - Response Delegate
  weak var response: RetrieveLibrariesInteractorReponse?
  
  // MARK: - Init

  init(repository: KamuLibraryRepository) {
    self.repository = repository
  }
  
  // MARK: - Private Methods
  
  private func openLibraryJSON() -> [[String: Any]]? {
    
        if let url = Bundle.main.url(forResource: "library", withExtension: "json") {
          do {
            let data = try Data(contentsOf: url)
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return json as? [[String: Any]]
          } catch {
            return nil
          }
        }
    return nil
  }
  
}

extension RetrieveLibrariesInteractor: RetrieveLibrariesInteractorInterface {
  
  func getLibraries() {
    
    guard let resp = response else {
      dump("RetrieveLibrariesInteractorReponse is nil")
      return
    }
    
    if let jsonArray = openLibraryJSON(),
      repository.getObjectsCount() == 0 {
      
      let libraries = KamuLibrary.parseArrayFromJSON(array: jsonArray)
      for lib in libraries {
        _ = repository.create(a: lib)
      }
    }
    
    resp.getLibrariesSuccess(libraries: repository.getAll())
  }
  
}
