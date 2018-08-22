//
//  KamuSettingsSwitchCell.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 22/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

class KamuSettingsSwitchCell: UITableViewCell {

  // MARK: - Outlet
  
  @IBOutlet weak var switchControl: UISwitch!
  @IBOutlet weak var lblName: UILabel!
  
  // MARK: - Life Cycle
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    self.tintColor = KamuColors.red
  }
  
  // MARK: - Configuration
  
  func setLabel(text: String) {
    lblName.text = text
  }
    
}
