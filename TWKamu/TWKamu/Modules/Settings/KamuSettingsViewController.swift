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
  
  func viewConfiguration() {
    
  }
  
  // MARK: - Class Methods
  
  // MARK: - UIActions
  
}

// MARK: - Extensions

extension KamuSettingsViewController: KamuSettingsViewInterface {
}
