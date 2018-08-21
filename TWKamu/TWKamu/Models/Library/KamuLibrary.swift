//
//  KamuLibrary.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 16/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

struct KamuLibrary {
  
  var cityName: String = ""
  var slug: String = ""
  var books: [KamuBook] = []
  var id:Int = -1
  
  private enum CodingKeys {
    
    static let cityName = "name"
    static let slug = "slug"
    static let id = "pk"
    static let field = "fields"
  }
  
}

extension KamuLibrary: Equatable {
  
  static func ==(l: KamuLibrary, r: KamuLibrary) -> Bool {
    return l.cityName == r.cityName &&
      l.id == r.id
  }
}

extension KamuLibrary {
  
  static func parseArrayFromJSON(array:[[String:Any]]) -> [KamuLibrary] {
    
    var libraraies:[KamuLibrary] = []
    
    for obj in array {
      
      let id = obj[CodingKeys.id] as? Int ?? -1

      let dic = obj[CodingKeys.field] as? [String:Any] ?? [:]
      
      let cityName = dic[CodingKeys.cityName] as? String ?? ""
      let slug = dic[CodingKeys.slug] as? String ?? ""
      
      let lib = KamuLibrary(cityName: cityName, slug: slug, books: [], id: id)
      
      libraraies.append(lib)
    }
    
    return libraraies
  }
  
}
