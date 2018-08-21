//
//  KamuRedButton.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 20/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

import UIKit

class KamuRedButton: UIButton {
  
  // MARK: - Class Properties
  
  private var indicatorView:UIActivityIndicatorView = UIActivityIndicatorView()
  private var title:String = ""
  private var shadowLayer: CAShapeLayer!
  
  private var baseColor: UIColor = KamuColors.red
  private var disabledColor: UIColor = KamuColors.plaeGrey
  
  // MARK: - Public Properties
  
  // MARK: - Class Init
  
  override init(frame: CGRect) {
    // set myValue before super.init is called
    super.init(frame: frame)
    // set other operations after super.init, if required
  }
  
  override public func awakeFromNib() {
    super.awakeFromNib()
    
    self.addTarget(self,
                   action: #selector(pulseAnimation),
                   for: .touchUpInside)
    
    self.addTarget(self,
                   action: #selector(disableForASec),
                   for: .touchUpInside)
    
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    /// Set Round Corners
    self.roundCorners(.allCorners, radius: 10)
    
    setUpFonts()
    
    /// Set Colors
    setDefaultColors()
    
    /// SetUp IndicatorView inside the button
    setUpIndicatorView()
    
  }
  
  // MARK: - Class Methods
  
  private func setDefaultColors() {
    
    let titleColor = isEnabled ? UIColor.white : KamuColors.steel
    self.setTitleColor(titleColor, for: .normal)
    
    self.backgroundColor = isEnabled ? baseColor : disabledColor
    
  }
  
  private func setUpFonts() {
    
    if let label = self.titleLabel {
      label.font = UIFont.btnTitleWhite
    }
    
    let titleColor = isEnabled ? UIColor.white : KamuColors.steel
    self.setTitleColor(titleColor, for: .normal)
    
  }
  
  // MARK: - Public Methods
  
  // MARK: - Touch Animation
  
  @objc func disableForASec() {
    self.isUserInteractionEnabled = false
    DispatchQueue.main.async {
      Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
        self.isUserInteractionEnabled = true
      }
    }
    
  }
  
  @objc func pulseAnimation() {
    
    UIView.animate(withDuration: TimeInterval(0.1), animations: {
      
      self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
      
    }, completion: { _ in
      
      UIView.animate(withDuration: TimeInterval(0.1),
                     animations: {
                      () -> Void in
                      self.transform = CGAffineTransform(scaleX: 1, y: 1)
      })
      
    })
  }
  
  // MARK: - Indicator
  private func setUpIndicatorView() {
    
    let buttonHeight = self.bounds.size.height
    let buttonWidth = self.bounds.size.width
    let centerPoint =  CGPoint( buttonWidth/2, buttonHeight/2 )
    
    indicatorView.center = centerPoint
    indicatorView.tag = tag
    indicatorView.color = .white
    indicatorView.tintColor = .white
    
    indicatorView.hidesWhenStopped = true
    
    self.addSubview(indicatorView)
    
  }
  
  func loadingIndicator(show: Bool) {
    
    if (show) {
      self.isUserInteractionEnabled = false
      self.setTitle("", for: .normal)
      backgroundColor = disabledColor
      indicatorView.startAnimating()
    } else {
      self.isUserInteractionEnabled = true
      backgroundColor = baseColor
      self.setTitle(self.title, for: .normal)
      indicatorView.stopAnimating()
    }
    
    let titleColor = isEnabled ? UIColor.white : KamuColors.steel
    self.setTitleColor(titleColor, for: .normal)
    
  }
  
}
