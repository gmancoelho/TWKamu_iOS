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
}

extension KamuLibrary: Equatable {
  
  static func ==(l: KamuLibrary, r: KamuLibrary) -> Bool {
    return l.cityName == r.cityName &&
      l.id == r.id
  }
}
