//
//  KamuSettingsViewController.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 22/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//

import UIKit

final class KamuSettingsViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var lbltitle: UILabel!
  
  @IBOutlet weak var tableView: UITableView!
  
  @IBOutlet weak var viewGoodCare: UIView!
  @IBOutlet weak var imgKamu: UIImageView!
  @IBOutlet weak var lblGoodCare: UILabel!

  // MARK: - Class properties
  
  // MARK: - Public properties
  
  var presenter: KamuSettingsPresenterInterface!
  
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
  
  private func viewConfiguration() {
    self.title = KamuStrings.Labels.settings_title
    lbltitle.text = KamuStrings.Labels.settings_title
    lblGoodCare.text = KamuStrings.Labels.settings_goodCare
    configureTableView()
  }
  
  private func configureTableView() {
    
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView = presenter.configureCells(tableView: tableView)
    
    tableView.reloadData()
  }
  
  // MARK: - Class Methods
  
  // MARK: - UIActions
  
}

// MARK: - Extensions

extension KamuSettingsViewController: UITableViewDataSource, UITableViewDelegate {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return presenter.totalSections()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.totalItemsFor(section: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return presenter.cellFor(index: indexPath, tableView: tableView)
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return presenter.nameForSection(section: section)
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.clickInCellForRow(index: indexPath)
  }
  
}

extension KamuSettingsViewController: KamuSettingsViewInterface {
  func updateTableView() {
    tableView.reloadData()
  }
}
