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
  
  private var shadowLayer: CAShapeLayer!
  
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
    let rad = self.frame.height/2
    self.roundCorners(.allCorners, radius: rad)
    
    setUpFonts()
    setShadow()
  }
  
  // MARK: - Class Methods

  private func setShadow() {
    
    let size = self.layer.frame.height / 2
    shadowLayer = CAShapeLayer()
    shadowLayer.path = UIBezierPath(roundedRect: bounds,
                                    cornerRadius: size).cgPath
    
    let bgColor: UIColor = KamuColors.red
    shadowLayer.fillColor = bgColor.cgColor
    
    shadowLayer.shadowColor = KamuColors.steel.cgColor
    shadowLayer.shadowPath = shadowLayer.path
    shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    shadowLayer.shadowOpacity = 0.8
    shadowLayer.shadowRadius = 2
    
    layer.insertSublayer(shadowLayer, at: 0)
  }
  
  private func setUpFonts() {
    
    if let label = self.titleLabel {
      label.font = UIFont.btnTitleWhite
    }
    
    self.setTitleColor(.white, for: .normal)
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
  
}
