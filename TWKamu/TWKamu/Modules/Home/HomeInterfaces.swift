//
//  HomeInterfaces.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 13/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//
//

import UIKit

enum HomeNavigationOption {
  
  case goToLibraries
  case showError(String)

}

protocol HomeWireframeInterface: WireframeInterface {
  func navigate(to option: HomeNavigationOption)
}

protocol HomeViewInterface: ViewInterface {
  
  func loginButtonIs(enabled:Bool)
  func loginCompleted(success:Bool)
}

protocol HomePresenterInterface: PresenterInterface {
  
  // Properties

  var minimumPasswordSize: Int { get }

  // Actions
  
  func startIsPressed()
  func tfEmailIsChanged(email:String)
  func tfPasswordIsChanged(password:String)
  
  // Configuration

  func configureStartButton() -> String
  func configureWelcomeLabel() -> String
  
  // Notification
  func showErrorMessage(message:String)

}

protocol HomeInteractorInterface: InteractorInterface {
}
