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
  
  @IBOutlet weak var lbldesc: UILabel!
  @IBOutlet weak var lblWelcome: UILabel!
  @IBOutlet weak var btnStart: KamuRedButton!
  @IBOutlet weak var imgLogo: UIImageView!
  @IBOutlet weak var viewTextFields: UIView!
  
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
    lblWelcome.text = presenter.configureWelcomeLabel()
    btnStart.setTitle(presenter.configureStartButton(), for: .normal)
  }
  
  // MARK: - Class Methods
  
  // MARK: - UIActions
  
  @IBAction func startIsPressed(_ sender: Any) {
    presenter.startIsPressed()
  }
  
}

// MARK: - Extensions

extension HomeViewController: HomeViewInterface {
  
}

extension HomeViewController: KamuClearNavigationBarTheme { }

