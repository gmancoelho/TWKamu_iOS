//
//  KamuSplashInterfaces.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 20/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

enum KamuSplashNavigationOption {
  
  case goToHome
}

protocol KamuSplashWireframeInterface: WireframeInterface {
  func navigate(to option: KamuSplashNavigationOption)
}

protocol KamuSplashViewInterface: ViewInterface {
  func startAnimation()
}

protocol KamuSplashPresenterInterface: PresenterInterface {
  func animationIsCompleted()
}

