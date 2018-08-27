//
//  KamuBooksInteractor.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 22/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//
//

import Foundation

final class KamuBooksInteractor {
  
  // MARK: - Properties
  let repository: KamuBookRepository!

  // MARK: - Response Delegate
  weak var response: KamuBooksInteractorInterfaceResponse!
  
  // MARK: - Init
  
  init(repository: KamuBookRepository) {
    self.repository = repository
  }
  
  // MARK: - Private Methods
  
  private func openLibraryJSON() -> [[String: Any]]? {
    
    if let url = Bundle.main.url(forResource: "books", withExtension: "json") {
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

extension KamuBooksInteractor: KamuBooksInteractorInterface {
  
  func getBooks() {
    
    guard let resp = response else {
      dump("RetrieveLibrariesInteractorReponse is nil")
      return
    }
    
    if let jsonArray = openLibraryJSON() {
      
      let books = KamuBook.parseArrayFromJSON(array: jsonArray)
      for book in books {
        _ = repository.create(a: book)
      }
    }
    
    let books = repository.getAll()
    resp.getBooksSuccess(books: books)
  }
  
}
