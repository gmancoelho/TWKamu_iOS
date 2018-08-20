//
//  KamuDataBase.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 16/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation
import RealmSwift

final class KamuDataBase {
  
  private var realm:Realm!
  
  // MARK: - Singleton
  
  static let shared = KamuDataBase()
  
  private init() {
    realm = configureRealm()
  }
  
  // MARK: - Public Methods
  
  func getRealmDB() -> Realm {
    return realm
  }
  
  // MARK: - Static
  
  private func configureRealm() -> Realm {
    
    let config = Realm.Configuration()
    
    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = "KamuDB_Prod"
    
    // Open the Realm with the configuration
     return try! Realm(configuration: config)
  }
  
}
