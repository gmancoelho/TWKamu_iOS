//
//  KamuBooksInteractorInterface.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 22/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//
//

import UIKit

protocol KamuBooksInteractorInterface {
  func getBooks()

}

protocol KamuBooksInteractorInterfaceResponse: class {
  func getBooksSuccess(books: [KamuBook])
  func getBooksError(errorMessage: String)
}
