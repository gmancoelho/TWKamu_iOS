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
    self.viewConfiguration()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Init Deinit -
  
  required convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
  deinit {
    
  }
  
  // MARK: - Class Configurations
  
  func viewConfiguration() {
    
    self.title = KamuStrings.Labels.libraries_office
    
    configureTableView()
  }
  
  // MARK: - Class Methods
  
  private func configureTableView() {
    
    tableView.dataSource = self
    tableView.delegate = self
    
    let id = presenter.libraryCellId()
    let nib = UINib(nibName: id, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: id)
    
  }
  
  // MARK: - UIActions
  
}

// MARK: - Extensions

extension LibrariesViewController: LibrariesViewInterface {
  
  func updateTableView() {
    tableView.reloadData()
  }
  
}

extension LibrariesViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.totalItems()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return presenter.cellFor(index: indexPath, tableView: tableView)
  }
  
}

extension LibrariesViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.clickInCellForRow(index: indexPath)
  }

}
