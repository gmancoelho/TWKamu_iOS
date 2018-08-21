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
  var publicationDate: String = ""
  
  private enum CodingKeys {
    
    static let id = "pk"
    static let field = "fields"

    static let author = "author"
    static let title = "title"
    static let subtitle = "subtitle"
    static let desc = "description"
    static let imgUrl = "image_url"
    static let isbn = "isbn"
    static let publisher = "publisher"
    static let numberOfPages = "number_of_pages"
    static let publicationDate = "publication_date"

  }
  
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

extension KamuBook {
  
  static func parseArrayFromJSON(array:[[String:Any]]) -> [KamuBook] {
    
    var books:[KamuBook] = []
    
    for obj in array {
      
      //let id = obj[CodingKeys.id] as? Int ?? -1
      
      let dic = obj[CodingKeys.field] as? [String:Any] ?? [:]
      
      let author = dic[CodingKeys.author] as? String ?? ""
      let title = dic[CodingKeys.title] as? String ?? ""
      let subtitle = dic[CodingKeys.subtitle] as? String ?? ""
      let desc = dic[CodingKeys.desc] as? String ?? ""
      let imgUrl = dic[CodingKeys.imgUrl] as? String ?? ""
      let isbn = dic[CodingKeys.isbn] as? String ?? ""
      let publisher = dic[CodingKeys.publisher] as? String ?? ""
      let numberOfPages = dic[CodingKeys.numberOfPages] as? Int ?? -1
      let publicationDate = dic[CodingKeys.publicationDate] as? String ?? ""
      
      let book = KamuBook(author: author,
                          title: title,
                          subtitle: subtitle,
                          desc: desc,
                          imgUrl:imgUrl,
                          isbn: isbn,
                          publisher: publisher,
                          user: nil,
                          borrowDate: nil,
                          numberOfPages: numberOfPages,
                          publicationDate: publicationDate)
      
      books.append(book)
    }
    
    return books
  }
  
}

