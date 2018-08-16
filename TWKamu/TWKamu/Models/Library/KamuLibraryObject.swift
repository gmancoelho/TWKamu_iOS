//
//  KamuLibraryObject.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 16/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import RealmSwift
import Foundation

class KamuLibraryObject: Object {
  
  // MARK: - Properties
  
  @objc dynamic var cityName: String = ""
  
  // MARK: - Init
  
  convenience init(cityName: String) {
    self.init()
    self.cityName = cityName
  }
  
  // MARK: - Adapter
  
  var kamuLibrary: KamuLibrary {
    return KamuLibrary(cityName: self.cityName)
  }

}

// MARK: - KamuLibrary Adapter

extension KamuLibrary {
  var object: KamuLibraryObject {
    return KamuLibraryObject(cityName: cityName)
  }
}

