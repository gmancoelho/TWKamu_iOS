//
//  LibrariesInterfaces.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 13/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//
//

import UIKit

enum LibrariesNavigationOption {
}

protocol LibrariesWireframeInterface: WireframeInterface {
  func navigate(to option: LibrariesNavigationOption)
}

protocol LibrariesViewInterface: ViewInterface {
}

protocol LibrariesPresenterInterface: PresenterInterface {
}

