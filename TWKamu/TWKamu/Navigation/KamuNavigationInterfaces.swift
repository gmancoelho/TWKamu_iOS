//
//  KamuNavigationInterfaces.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 10/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

protocol Themeable {
  
  var navigationBarBackgroundColor: UIColor { get }
  var navigationBarTintColor: UIColor { get }
  var navigationTitleTextAttributes: [NSAttributedString.Key : Any] { get }
  var navigationBarStyle: UIBarStyle { get }
  var navigationBarTranslucent: Bool { get }
  
}

protocol StatusBarTheme {
  var navigationStatusBarStyle: UIStatusBarStyle? { get }
}
