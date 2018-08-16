//
//  RetrieveLibrariesInteractorProtocols.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 16/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

protocol RetrieveLibrariesInteractorProtocol {
  
  func getLibraries()
  
}

protocol RetrieveLibrariesInteractorReponse {
  
  func getLibrariesSuccess(libraries: [String])
  func getLibrariesError(errorMessage: String)

}
