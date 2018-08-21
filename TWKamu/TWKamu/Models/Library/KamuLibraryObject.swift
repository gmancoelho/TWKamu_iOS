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
  @objc dynamic var id:Int = -1
  
  // MARK: - PK
  
  override static func primaryKey() -> String? {
    return "id"
  }

  // MARK: - Init
  
  convenience init(cityName: String, id: Int) {
    self.init()
    self.cityName = cityName
    self.id = id
  }
  
  // MARK: - Adapter
  
  var kamuLibrary: KamuLibrary {
    return KamuLibrary(cityName: self.cityName, id: self.id)
  }

}

// MARK: - KamuLibrary Adapter

extension KamuLibrary {
  var object: KamuLibraryObject {
    return KamuLibraryObject(cityName: cityName, id: id)
  }
}

