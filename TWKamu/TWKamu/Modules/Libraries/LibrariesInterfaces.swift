//
//  LibrariesInterfaces.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 13/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//
//

import UIKit

enum LibrariesNavigationOption {
  
  case back
  case goToLibrary(KamuLibrary)
  
}

protocol LibrariesWireframeInterface: WireframeInterface {
  func navigate(to option: LibrariesNavigationOption)
}

protocol LibrariesViewInterface: ViewInterface {
  func updateTableView()
}

protocol LibrariesPresenterInterface: PresenterInterface {
  
  // TableView Methods
  func libraryCellId() -> String
  func totalItems() -> Int
  func cellFor(index: IndexPath, tableView: UITableView) -> UITableViewCell
  
  func clickInCellForRow(index:IndexPath)
}

