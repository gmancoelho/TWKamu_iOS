//
//  KamuStrings.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 13/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

enum KamuStrings {
  
  enum Error {
    
    static let opsError = "An unexpected error has ocurred."
    static let unexpectedError = "Try again."
  }
  
  enum Labels {
    
    static let home_welcome = "Welcome"
    static let home_desc = "Please use your TW email and password to login:"
    static let home_emailError = "Please provide a valid email"
    static let home_emailPlaceHolder = "TW Email"
    static let home_passwordPlaceHolder = "Password"

    static let libraries_office = "Select office"
    static let libraries_cities = "CITIES"

    static let explore_title = "Explore"
  }
  
  enum Buttons {
    
    static let login = "Login"
    static let explore_back = "Change office"
    
    static let borrow = "Borrow"
    static let borrowed = "Borrowed"
  }
}
