//
//  KamuBook.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 21/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

struct KamuBook {
  
  var author: String = ""
  var title: String = ""
  var subtitle: String = ""
  var desc: String = ""
  var imgUrl: String = ""
  var isbn: String = ""
  var publisher: String = ""
  
  var user: String? = nil
  var borrowDate: Date? = nil
  
  var numberOfPages: Int = -1
  var publicationDate: Date = Date(timeIntervalSince1970: 0)
  
}

extension KamuBook: Equatable {
  
  static func ==(l: KamuBook, r: KamuBook) -> Bool {
    return l.author == r.author &&
      l.publisher == r.publisher &&
      l.title == r.title &&
      l.subtitle == r.subtitle &&
      l.isbn == r.isbn
  }
}
