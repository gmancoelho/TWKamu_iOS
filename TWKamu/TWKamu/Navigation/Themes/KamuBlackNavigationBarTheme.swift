//
//  KamuBlackNavigationBarTheme.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 10/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

protocol KamuBlackNavigationBarTheme: StatusBarTheme, Themeable { }

extension KamuBlackNavigationBarTheme {
  
  var navigationStatusBarStyle: UIStatusBarStyle? {
    return .default
  }
}

extension KamuBlackNavigationBarTheme {
  
  var navigationBarBackgroundColor: UIColor {
    return UIColor.white
  }
  
  var navigationBarTintColor: UIColor {
    return UIColor.clear
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
