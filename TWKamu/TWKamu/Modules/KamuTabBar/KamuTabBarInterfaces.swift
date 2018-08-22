//
//  KamuTabBarInterfaces.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 22/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

protocol KamuTabbedControllerInterface where Self:UIViewController {
  
  func selectedIndex(index:Int)
  
}

enum KamuTabBarNavigationOption {
  
  case selectedExplore
  case selectedMyBooks
  case selectedWishlist
  case selectedSettings

}

enum KamuTabItens {
  
  case explore
  case myBooks
  case wishlist
  case settings

  var tabItens:UITabBarItem {
    
    switch self {
      
    case .explore:
      return UITabBarItem(title: KamuStrings.Labels.explore_title,
                          image: UIImage(named: "iconTabExplore"), tag: 0)
      
    case .myBooks:
      return UITabBarItem(title: KamuStrings.Labels.myBooks_title,
                          image: UIImage(named: "iconTabBook"), tag: 1)
      
    case .wishlist:
      return UITabBarItem(title: KamuStrings.Labels.wishlist_title,
                          image: UIImage(named: "iconTabWishlist"), tag: 2)
      
    case .settings:
      return UITabBarItem(title: KamuStrings.Labels.settings_title,
                          image: UIImage(named: "iconTabSettings"), tag: 3)
    }
    
  }
  
}

protocol KamuTabBarWireframeInterface: WireframeInterface {
  func navigate(to option: KamuTabBarNavigationOption)
}
