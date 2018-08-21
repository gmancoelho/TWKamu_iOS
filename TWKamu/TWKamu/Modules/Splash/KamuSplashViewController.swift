//
//  KamuSplashViewController.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 20/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit
import Lottie

class KamuSplashViewController: UIViewController {
  
  // MARK: - Outlets
  
  // MARK: - Class Properties
  
  private let splashAnimation = LOTAnimationView(name: KamuConstants.Animations.splash)

  var presenter: KamuSplashPresenterInterface!

  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    configuration()
    presenter.viewDidAppear(animated: animated)
  }
  
  // MARK: - Init
  
  required convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
  deinit {
    
  }
  
  // MARK: - Class Methods
  
  private func configuration() {
    
    let newWidth = self.view.frame.width / 3.0
    splashAnimation.frame = CGRect(x: 0, y: 0, width: newWidth, height: newWidth)
    splashAnimation.center = self.view.center
    splashAnimation.contentMode = .scaleAspectFit

    self.view.addSubview(splashAnimation)
  }
  
  // MARK: - Actions
  
}

extension KamuSplashViewController: KamuSplashViewInterface {
  
  func startAnimation() {
    
    splashAnimation.play { (finished) in
      print("Finished")
      self.presenter.animationIsCompleted()
    }
  }
  
}

// MARK: - navigaiton Theme

extension KamuSplashViewController: KamuClearNavigationBarTheme { }
