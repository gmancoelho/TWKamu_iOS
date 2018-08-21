//
//  String+Extension.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 21/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

extension String {
  
  // MARK: - Email Regex
  
  var isEmailValid: Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
  }
}
