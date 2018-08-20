//
//  UIViewController+Extension.swift
//  PrivilegeJourney
//
//  Created by Guilherme Coelho on 26/07/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

protocol Alertable {
  func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void)
}

extension Alertable where Self: UIViewController {

  func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    for (index, option) in options.enumerated() {
      
      if index == 0 {
        
        alertController.addAction(UIAlertAction.init(title: option, style: .cancel, handler: { (action) in
          completion(index)
        }))
        
      } else {
        
        alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
          completion(index)
        }))
      }

    }
    self.present(alertController, animated: true, completion: nil)
  }
}
