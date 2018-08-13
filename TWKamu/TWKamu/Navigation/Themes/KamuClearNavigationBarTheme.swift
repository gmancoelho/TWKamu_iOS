//
//  KamuClearNavigationBarTheme.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 13/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

protocol KamuClearNavigationBarTheme: StatusBarTheme, Themeable { }

extension KamuClearNavigationBarTheme {
  
  var navigationStatusBarStyle: UIStatusBarStyle? {
    return .lightContent
  }
}

extension KamuClearNavigationBarTheme {
  
  var navigationBarBackgroundColor: UIColor {
    return UIColor.clear
  }
  
  var navigationBarTintColor: UIColor {
    return .white
  }
  
  var navigationTitleTextAttributes: [NSAttributedString.Key: Any] {
    let font = UIFont.preferredFont(forTextStyle: .headline)
    return [.foregroundColor: UIColor.clear, .font: font]
  }
  
  var navigationBarStyle: UIBarStyle {
    return .default
  }
  
  var navigationBarTranslucent: Bool {
    return true
  }
}
