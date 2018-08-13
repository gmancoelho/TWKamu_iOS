//
//  HomeViewController.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 13/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var lblWelcome: UILabel!
  @IBOutlet weak var btnStart: UIButton!
  
  // MARK: - Class properties
  
  // MARK: - Public properties
  
  var presenter: HomePresenterInterface!
  
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
    configureStartButton()
    configureWelcomeLabel()
    
  }
  
  private func configureWelcomeLabel() {
    lblWelcome.text = KamuStrings.Labels.welcome
  }
  
  private func configureStartButton() {
    btnStart.setTitle(KamuStrings.Buttons.start, for: .normal)
  }
  
  // MARK: - Class Methods
  
  // MARK: - UIActions
  
  @IBAction func startIsPressed(_ sender: Any) {
  }
  
  
}

// MARK: - Extensions

extension HomeViewController: HomeViewInterface {
}
