//
//  KamuLibraryCell.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 14/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

class KamuLibraryCell: UITableViewCell {

  // MARK: - Outlet
  
  @IBOutlet weak var lblCity: UILabel!
  
  // MARK: - Life Cycle
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  // MARK: - Configuration
  
  func setCity(city: String) {
    lblCity.text = city
  }
  
}
