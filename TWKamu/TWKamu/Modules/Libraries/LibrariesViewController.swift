//
//  LibrariesViewController.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 13/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//

import UIKit

final class LibrariesViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Class properties
  
  // MARK: - Public properties
  
  var presenter: LibrariesPresenterInterface!
  
  // MARK: - Life Cycle - 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewConfiguration()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter.viewWillAppear(animated: animated)
    
  }

  // MARK: - Init Deinit -
  
  required convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
  deinit {
    
  }
  
  // MARK: - Class Configurations
  
  private func viewConfiguration() {
    
    self.title = KamuStrings.Labels.libraries_office
    
    configureTableView()
  }
  
  // MARK: - Class Methods
  
  private func configureTableView() {
    
    
    let id = presenter.libraryCellId()
    let nib = UINib(nibName: id, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: id)
    
    tableView.dataSource = self
    tableView.delegate = self
    
    updateTableView()

  }
  
  // MARK: - UIActions
  
}

// MARK: - Extensions

extension LibrariesViewController: LibrariesViewInterface {
  
  func updateTableView() {
    tableView.reloadData()
  }
  
}

extension LibrariesViewController: UITableViewDataSource, UITableViewDelegate {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.totalItems()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return presenter.cellFor(index: indexPath, tableView: tableView)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = UIView()
    
    view.backgroundColor = UIColor.white
    
    let label = UILabel()
    label.text = KamuStrings.Labels.libraries_cities
    label.frame = CGRect(x: 12, y: view.center.y, width: 100, height: 35)
    label.textColor = KamuColors.steel
    label.font = UIFont.detailLabel
    
    let divider = UIView()
    
    divider.backgroundColor = KamuColors.steel
    divider.frame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.size.width, height: 1)
    
    view.addSubview(label)
    view.addSubview(divider)

    return view
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.clickInCellForRow(index: indexPath)
  }
  
}

extension LibrariesViewController: KamuBlackNavigationBarTheme {}
