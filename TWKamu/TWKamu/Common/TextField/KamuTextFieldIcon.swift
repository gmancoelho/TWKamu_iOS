//
//  KamuTextField.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 20/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

class KamuTextFieldIcon: SkyFloatingLabelTextFieldWithIcon {
 
  func basicSetUp() {
    
    self.titleColor = KamuColors.steel
    self.placeholderColor = KamuColors.steel
    self.tintColor = KamuColors.red
    self.errorColor = KamuColors.red
    self.lineColor = KamuColors.steel
    self.selectedLineColor = KamuColors.steel
    self.selectedTitleColor = KamuColors.steel
    
    self.iconType = .image
  }
  
}
