//
//  KamuBookedView.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 27/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

class KamuBookedView: UIView {
  
  // MARK: - Outlets
  
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var imgPhoto: UIImageView!
  @IBOutlet weak var labelsStackView: UIStackView!
  @IBOutlet weak var lblBorrowWith: UILabel!
  @IBOutlet weak var lblName: UILabel!
  @IBOutlet weak var lblDate: UILabel!
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit() {
    
    Bundle.main.loadNibNamed("KamuBookedView", owner: self, options: nil)
    addSubview(contentView)
    
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    
    configureBackgroundAndCorner()
    configureImagePhoto()
    configureLabels()
    
  }
  
  // MARK: - Configuration
  
  private func configureBackgroundAndCorner() {
    
    contentView.backgroundColor = KamuColors.paleGrey
    contentView.layer.cornerRadius = 10
    contentView.layer.masksToBounds = true
    
    imgPhoto.layer.cornerRadius = imgPhoto.frame.width / 2
    imgPhoto.layer.borderWidth = 2
    imgPhoto.layer.borderColor = KamuColors.steel.cgColor
  }
  
  private func configureImagePhoto() {
    imgPhoto.image = UIImage(named: "iconUserPlaceholder")
  }
  
  private func configureLabels() {
    lblName.text = ""
    lblBorrowWith.text = "Borrowed with:"
    lblDate.text = "• 1 month ago"
  }
  
}
