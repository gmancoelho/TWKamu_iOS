//
//  KamuBookCell.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 21/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

class KamuBookCell: UICollectionViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var imgBookCover: UIImageView!
  @IBOutlet weak var stackView: UIStackView!
  @IBOutlet weak var lblBookTitle: UILabel!
  @IBOutlet weak var lblBookAuthor: UILabel!
  
  @IBOutlet weak var btnBorrow: KamuRedButton!
  
  // MARK: - Cell Init

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  // MARK: - Configurations
  
  func configureCellWith(title: String, author: String, cover: UIImage? = UIImage(named: "placeholderIcon"), isBorrowed: Bool) {
    
    lblBookTitle.text = title
    lblBookAuthor.text = author
    imgBookCover.image = cover
    btnBorrow.isEnabled = isBorrowed
    
  }
  
  // MARK: - Actions
  
  @IBAction func borrowIsPressed(_ sender: Any) {
  
  }
  
}
