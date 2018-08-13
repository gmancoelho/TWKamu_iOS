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
}

protocol HomeWireframeInterface: WireframeInterface {
  func navigate(to option: HomeNavigationOption)
}

protocol HomeViewInterface: ViewInterface {
}

protocol HomePresenterInterface: PresenterInterface {
}

protocol HomeInteractorInterface: InteractorInterface {
}
