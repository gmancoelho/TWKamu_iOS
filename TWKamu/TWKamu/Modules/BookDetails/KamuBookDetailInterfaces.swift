//
//  KamuBookDetailInterfaces.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 23/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//
//

import UIKit

enum KamuBookDetailNavigationOption {
}

protocol KamuBookDetailWireframeInterface: WireframeInterface {
  func navigate(to option: KamuBookDetailNavigationOption)
}

protocol KamuBookDetailViewInterface: ViewInterface {
  
  func updateBookSumary(sumary: String)
  func updateBookAuthor(author: String)
  func updateBookTitle(title: String)
  func updateBookPages(pages: String)
  func updateBookPubDate(date: String)
  func updateBookAvailability(availability: String)
  func updateBookCover(bookCover: UIImage)

}

protocol KamuBookDetailPresenterInterface: PresenterInterface {
}
