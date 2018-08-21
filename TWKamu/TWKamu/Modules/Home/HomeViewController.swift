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
  
  @IBOutlet weak var bottonConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var lbldesc: UILabel!
  @IBOutlet weak var lblWelcome: UILabel!
  @IBOutlet weak var btnStart: KamuRedButton!
  @IBOutlet weak var imgLogo: UIImageView!
  @IBOutlet weak var viewTextFields: UIView!
  
  @IBOutlet weak var tfPassword: KamuTextFieldIcon!
  @IBOutlet weak var tfEmail: KamuTextFieldIcon!
  
  // MARK: - Class properties
  
  let underKeyboardLayoutConstraint = UnderKeyboardLayoutConstraint()

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
    
    configureTextFields()
    configureButtons()
    
    hideKeyboardWhenTap()
    addTextFieldObservers()
    
    lblWelcome.text = presenter.configureWelcomeLabel()
  }
  
  // MARK: - Class Methods
  
  private func configureButtons() {
    
    btnStart.isEnabled = false
    btnStart.setTitle(presenter.configureStartButton(), for: .normal)
    
  }
  
  private func configureTextFields() {
    
    tfEmail.delegate = self
    tfPassword.delegate = self
    
    tfEmail.basicSetUp()
    tfPassword.basicSetUp()
    
    tfPassword.isSecureTextEntry = true

    tfEmail.placeholder = KamuStrings.Labels.home_emailPlaceHolder
    tfEmail.title = KamuStrings.Labels.home_emailPlaceHolder
    
    tfPassword.placeholder = KamuStrings.Labels.home_passwordPlaceHolder
    tfPassword.title = KamuStrings.Labels.home_passwordPlaceHolder

    tfEmail.iconImage = UIImage(imageLiteralResourceName: "iconEmail")
    tfPassword.iconImage = UIImage(imageLiteralResourceName: "iconPassword")
  }
  
  private func addTextFieldObservers() {
    
    underKeyboardLayoutConstraint.setup(bottonConstraint,
                                        view: view)
    
    // Get notified every time the text changes, so we can save it
    let notificationCenter = NotificationCenter.default
    notificationCenter.addObserver(self,
                                   selector: #selector(textFieldDidChange(_:)),
                                   name: Notification.Name.UITextFieldTextDidChange,
                                   object: nil)
  }
  
  // MARK: - TextField Observer
  
  @objc func textFieldDidChange(_ sender: Any) {
    
    if let notification = sender as? Notification,
      let textFieldChanged = notification.object as? UITextField {
      
      if textFieldChanged == self.tfEmail,
        let text = textFieldChanged.text {
        
        // TF is email type and have a valid text
        presenter.tfEmailIsChanged(email: text)
        
      } else if textFieldChanged == self.tfPassword,
        let text = textFieldChanged.text {
        
        // TF is password type and have a valid text
        presenter.tfPasswordIsChanged(password: text)
        
      }
    }
  }
  
  // MARK: - UIActions
  
  @IBAction func startIsPressed(_ sender: Any) {
    
    //hangs the screen when making a request
    self.viewEnabledIteractionIs(enabled: false)

    presenter.startIsPressed()
  }
  
  @IBAction func tfDidEndOnExit(_ sender: UITextField) {
    
    if sender == tfEmail {
      
      tfEmail.resignFirstResponder()
      tfPassword.becomeFirstResponder()
      
    } else if sender == tfPassword {
      
      tfPassword.resignFirstResponder()
      
    }
  }
}

// MARK: - Extensions

extension HomeViewController: UITextFieldDelegate {
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    switch textField {
      
    case tfEmail:
      if textField == tfEmail {
        if (string == " ") {
          return false
        }
      }
      
    case tfPassword:
      
      guard let text = textField.text else { return true }
      let newLength = text.count + string.count - range.length
      return newLength <= presenter.minimumPasswordSize
      
    default:
      return true
    }
    
    return true
  }
  
}

extension HomeViewController: HomeViewInterface {
  
  func loginCompleted(success:Bool) {
    if !success {
      self.viewEnabledIteractionIs(enabled: true)
    }
  }
  
  func viewEnabledIteractionIs(enabled: Bool) {
    self.view.superview?.isUserInteractionEnabled = enabled
    btnStart.loadingIndicator(show: !enabled)

  }
  
  func loginButtonIs(enabled: Bool) {
    btnStart.isEnabled = enabled
  }
  
  func showEmailWarning(show: Bool) {
    tfEmail.errorMessage = show ? nil : KamuStrings.Labels.home_emailError
  }
  
}

extension HomeViewController: KamuClearNavigationBarTheme { }

