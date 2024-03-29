//
//  KamuBookObject.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 21/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import RealmSwift
import Foundation

class KamuBookObject: Object {
  
  // MARK: - Properties
  
  @objc dynamic var author: String = ""
  @objc dynamic var title: String = ""
  @objc dynamic var subtitle: String = ""
  @objc dynamic var desc: String = ""
  @objc dynamic var imgUrl: String = ""
  @objc dynamic var isbn: String = ""
  @objc dynamic var publisher: String = ""
  
  @objc dynamic var user: String?
  @objc dynamic var borrowDate: Date?

  @objc dynamic var numberOfPages: Int = -1
  @objc dynamic var publicationDate: String = ""
  
  // MARK: - PK
  
  override static func primaryKey() -> String? {
    return "isbn"
  }
  
  // MARK: - Init
  
  convenience init(author: String,
                   title: String,
                   subtitle: String,
                   desc: String,
                   imgUrl: String,
                   isbn: String,
                   publisher: String,
                   user: String?,
                   borrowDate: Date?,
                   numberOfPages: Int,
                   publicationDate: String) {
    self.init()
    
    self.author = author
    self.title = title
    self.subtitle = subtitle
    self.imgUrl = imgUrl
    self.isbn = isbn
    self.publisher = publisher
    self.user = user
    self.borrowDate = borrowDate
    self.numberOfPages = numberOfPages
    self.publicationDate = publicationDate
    self.desc = desc

  }
  
  // MARK: - Adapter
  
  var kamuBook: KamuBook {
    
    return KamuBook(author: author,
                    title: title,
                    subtitle: subtitle,
                    desc: desc,
                    imgUrl: imgUrl,
                    isbn: isbn,
                    publisher: publisher,
                    user: user,
                    borrowDate: borrowDate,
                    numberOfPages: numberOfPages,
                    publicationDate: publicationDate)
  }
  
}

// MARK: - KamuLibrary Adapter

extension KamuBook {
  
  var object: KamuBookObject {
    
    return KamuBookObject(author: author,
                          title: title,
                          subtitle: subtitle,
                          desc: desc,
                          imgUrl: imgUrl,
                          isbn: isbn,
                          publisher: publisher,
                          user: user,
                          borrowDate: borrowDate,
                          numberOfPages: numberOfPages,
                          publicationDate: publicationDate)
  }
}
