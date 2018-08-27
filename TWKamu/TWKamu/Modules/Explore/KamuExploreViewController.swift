//
//  KamuExploreViewController.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 21/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//

import UIKit

final class KamuExploreViewController: UIViewController {
  
  // MARK: - Outlets  
  @IBOutlet weak var collectionView: UICollectionView!
  
  // MARK: - Class properties
  
  // MARK: - Public properties
  
  var presenter: KamuExplorePresenterInterface!
  
  // MARK: - Life Cycle - 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewConfiguration()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter.viewWillAppear(animated: animated)
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
    
    self.title = KamuStrings.Labels.explore_title
    configureCollectionView()
  }
  
  // MARK: - Class Methods
  
  private func configureCollectionView() {
    
    self.collectionView.delegate = self
    self.collectionView.dataSource = self
    
    let nib = UINib(nibName: presenter.returnCellId(), bundle: nil)
    
    self.collectionView.register(nib, forCellWithReuseIdentifier: presenter.returnCellId())
    
    self.collectionViewLayout()
    
    self.collectionView.reloadData()
    
  }
  
  private func collectionViewLayout() {
    
    let leftAndRightPaddings: CGFloat = 24.0
    let numberOfItemsPerRow: CGFloat = 2.0
    
    let bounds = UIScreen.main.bounds
    
    let width = (bounds.size.width - leftAndRightPaddings * (numberOfItemsPerRow)) / numberOfItemsPerRow
    let height:CGFloat = 300.0
    dump(width)
    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      layout.itemSize = CGSize(width, height)
    }
  }
  
  // MARK: - UIActions
  
}

// MARK: - Extensions

// MARK: - UICollectionView

extension KamuExploreViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter.clickInCell(index: indexPath)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return presenter.numberOfItens()
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return presenter.cellForIndex(index: indexPath, collectionView: collectionView)
  }
  
}

extension KamuExploreViewController: UICollectionViewDelegate { }

extension KamuExploreViewController: KamuExploreViewInterface {
  
  func updateCollectionView() {
    self.collectionView.reloadData()
  }
}
