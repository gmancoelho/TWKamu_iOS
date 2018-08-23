//
//  KamuSplashPresenter.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 20/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//
import UIKit

final class KamuSplashPresenter {
  
  // MARK: - Private properties -
  
  private unowned let view: KamuSplashViewInterface
  private let wireframe: KamuSplashWireframeInterface
  
  // MARK: - Lifecycle -
  
  init(wireframe: KamuSplashWireframeInterface,
       view: KamuSplashViewInterface) {
    self.wireframe = wireframe
    self.view = view
  }
  
}

// MARK: - Extensions -

extension KamuSplashPresenter: KamuSplashPresenterInterface {

  func animationIsCompleted() {
    wireframe.navigate(to: .goToHome)
  }
  
  func viewDidAppear(animated: Bool) {
    view.startAnimation()
  }
  
}
