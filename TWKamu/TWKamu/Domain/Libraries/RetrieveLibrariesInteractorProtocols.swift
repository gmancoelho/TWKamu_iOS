//
//  RetrieveLibrariesInteractorProtocols.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 16/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

protocol RetrieveLibrariesInteractorInterface {
  
  func getLibraries()
  
}

protocol RetrieveLibrariesInteractorReponse: class {
  
  func getLibrariesSuccess(libraries: [KamuLibrary])
  func getLibrariesError(errorMessage: String)

}
