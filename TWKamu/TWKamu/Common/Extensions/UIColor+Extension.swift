//
//  UIColorExtensions.swift
//  SwiftColors

import UIKit

public typealias Color = UIColor
public typealias Image = UIImage

public extension Color {
  
  public convenience init(_ hexString: String) {
    self.init(hexString: hexString, alpha: 1.0)
  }
  
  public convenience init(hexInt: Int, alpha: Float = 1.0) {
    var hexString = NSString(format: "%0X", hexInt)
    if hexInt <= 0xfff {
      hexString = NSString(format: "%03X", hexInt)
    } else if hexInt <= 0xffff {
      hexString = NSString(format: "%04X", hexInt)
    } else if hexInt <= 0xffffff {
      hexString = NSString(format: "%06X", hexInt)
    }
    self.init(hexString: hexString as String, alpha: alpha)
  }
  
  public convenience init(hexString: String, alpha: Float = 1.0) {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var mAlpha: CGFloat = CGFloat(alpha)
    var minusLength = 0
    
    let scanner = Scanner(string: hexString)
    
    if hexString.hasPrefix("#") {
      scanner.scanLocation = 1
      minusLength = 1
    }
    if hexString.hasPrefix("0x") {
      scanner.scanLocation = 2
      minusLength = 2
    }
    var hexValue: UInt64 = 0
    scanner.scanHexInt64(&hexValue)
    switch hexString.count - minusLength {
    case 3:
      red = CGFloat((hexValue & 0xF00) >> 8) / 15.0
      green = CGFloat((hexValue & 0x0F0) >> 4) / 15.0
      blue = CGFloat(hexValue & 0x00F) / 15.0
    case 4:
      red = CGFloat((hexValue & 0xF000) >> 12) / 15.0
      green = CGFloat((hexValue & 0x0F00) >> 8) / 15.0
      blue = CGFloat((hexValue & 0x00F0) >> 4) / 15.0
      mAlpha = CGFloat(hexValue & 0x00F) / 15.0
    case 6:
      red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
      green = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
      blue = CGFloat(hexValue & 0x0000FF) / 255.0
    case 8:
      red = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
      green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
      blue = CGFloat((hexValue & 0x0000FF00) >> 8) / 255.0
      mAlpha = CGFloat(hexValue & 0x000000FF) / 255.0
    default:
      break
    }
    self.init(red: red, green: green, blue: blue, alpha: mAlpha)
  }
  
  /// color components value between 0 to 255
  convenience init(red: Int, green: Int, blue: Int) {
    
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
  
}

public extension String {
  
  public var color: Color {
    return Color(hexString: self)
  }
  
}

public extension Int {
  
  public var color: Color {
    return Color(hexInt: self)
  }
  
}

public extension Color {
  
  public func toImage(size: CGSize = CGSize(width: 1, height: 1)) -> Image? {
    
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    self.setFill()
    UIRectFill(rect)
    let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
    
  }
  
}
