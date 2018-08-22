//
//  KamuSettingsInterfaces.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 22/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//
//

import UIKit

enum KamuSettingsNavigationOption {
  case goToHome
}

protocol KamuSettingsWireframeInterface: WireframeInterface {
  func navigate(to option: KamuSettingsNavigationOption)
}

protocol KamuSettingsViewInterface: ViewInterface {
  func updateTableView()
}

protocol KamuSettingsPresenterInterface: PresenterInterface {
  
  // TableView Methods
  
  func configureCells(tableView: UITableView) -> UITableView
  func totalItemsFor(section: Int) -> Int
  func totalSections() -> Int
  func nameForSection(section: Int) -> String

  func cellFor(index: IndexPath, tableView: UITableView) -> UITableViewCell
  
  func clickInCellForRow(index:IndexPath)
}
