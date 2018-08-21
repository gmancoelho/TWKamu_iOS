//
//  KamuExploreInterfaces.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 21/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//
//

import UIKit

enum KamuExploreNavigationOption {
  
  case back
  case goToDetail
  
}

protocol KamuExploreWireframeInterface: WireframeInterface {
  func navigate(to option: KamuExploreNavigationOption)
}

protocol KamuExploreViewInterface: ViewInterface {
}

protocol KamuExplorePresenterInterface: PresenterInterface {
}
