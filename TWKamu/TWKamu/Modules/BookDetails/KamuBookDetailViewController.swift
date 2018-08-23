//
//  KamuBookDetailViewController.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 23/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//

import UIKit

final class KamuBookDetailViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var topView: UIView!
  @IBOutlet weak var topStackView: UIStackView!
  @IBOutlet weak var imgBookCover: UIImageView!
  @IBOutlet weak var lblBookTitle: UILabel!
  @IBOutlet weak var lblBookAuthor: UILabel!
  @IBOutlet weak var lblBookAvailability: UILabel!
  @IBOutlet weak var lblBookAvailabilityNumber: UILabel!
  @IBOutlet weak var lblBookPages: UILabel!
  @IBOutlet weak var lblBookPagesNumber: UILabel!
  @IBOutlet weak var lblBookPublication: UILabel!
  @IBOutlet weak var lblBookPublicationDate: UILabel!
  
  @IBOutlet weak var borrowView: UIView!
  
  @IBOutlet weak var sumaryView: UIView!
  @IBOutlet weak var lblSumary: UILabel!
  @IBOutlet weak var lblBookSumary: UILabel!
  
  @IBOutlet weak var btnBorrow: KamuRedButton!
  
  // MARK: - Class properties
  
  // MARK: - Public properties
  
  var presenter: KamuBookDetailPresenterInterface!
  
  // MARK: - Life Cycle - 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewConfiguration()
    presenter.viewDidLoad()
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
    
    self.title = KamuStrings.Labels.details_title
    
    configureLabels()
    configureButtons()
  }
  
  // MARK: - Class Methods
  
  private func configureLabels() {
    
    lblSumary.text = KamuStrings.Labels.details_sumary
    lblBookPages.text = KamuStrings.Labels.details_pages
    lblBookPublication.text = KamuStrings.Labels.details_pub
    lblBookAvailability.text = KamuStrings.Labels.details_availability

  }
  
  private func configureButtons() {
    btnBorrow.setTitle(KamuStrings.Buttons.borrow, for: .normal)
  }
  
  // MARK: - UIActions
  
}

// MARK: - Extensions

extension KamuBookDetailViewController: KamuBookDetailViewInterface {
  
  func updateBookSumary(sumary: String) {
    lblBookSumary.text = sumary
  }
  
  func updateBookAuthor(author: String) {
    lblBookAuthor.text = author
  }
  
  func updateBookTitle(title: String) {
    lblBookTitle.text = title
  }
  
  func updateBookPages(pages: String) {
    lblBookPagesNumber.text = pages
  }
  
  func updateBookPubDate(date: String) {
    lblBookPublicationDate.text = date
  }
  
  func updateBookAvailability(availability: String) {
    lblBookAvailabilityNumber.text = availability
  }
  
  func updateBookCover(bookCover: UIImage) {
    imgBookCover.image = bookCover
  }
  
}
