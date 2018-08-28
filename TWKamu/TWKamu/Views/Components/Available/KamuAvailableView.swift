//
//  KamuAvailableView.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 28/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

class KamuAvailableView: UIView {
  
  // MARK: - Outlets
  
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var lblAvailable: UILabel!
  
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
    
    Bundle.main.loadNibNamed("KamuAvailableView", owner: self, options: nil)
    addSubview(contentView)
    
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    
    configureBackgroundAndCorner()
    configureLabels()
    
    self.layoutSubviews()
    
  }
  
  // MARK: - Configuration
  
  private func configureBackgroundAndCorner() {
    
    contentView.backgroundColor = KamuColors.paleGrey
    contentView.layer.cornerRadius = 10
    contentView.layer.masksToBounds = true
  }
  
  private func configureLabels() {
    lblAvailable.text = "Book Available"
  }
  
}
