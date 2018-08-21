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
  @objc dynamic var slug: String = ""
  @objc dynamic var id:Int = -1
  
  var books = List<KamuBookObject>()
  
  // MARK: - PK
  
  override static func primaryKey() -> String? {
    return "id"
  }

  // MARK: - Init
  
  convenience init(cityName: String, slug:String, books: [KamuBook], id: Int) {
    self.init()
    
    self.cityName = cityName
    self.id = id
    self.slug = slug
    
    let arr = books.map({$0.object})
    
    self.books = List(arr)
    
  }
  
  // MARK: - Adapter
  
  var kamuLibrary: KamuLibrary {
    return KamuLibrary(cityName: self.cityName,
                       slug: self.slug,
                       books: books.map({$0.kamuBook}),
                       id: self.id)
  }

}

// MARK: - KamuLibrary Adapter

extension KamuLibrary {
  var object: KamuLibraryObject {
    
    return KamuLibraryObject(cityName: cityName,
                             slug: slug,
                             books: books,
                             id: id)
  }
}

