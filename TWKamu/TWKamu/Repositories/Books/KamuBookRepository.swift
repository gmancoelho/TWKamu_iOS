//
//  KamuBookRepository.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 21/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation
import RealmSwift

final class KamuBookRepository {
  
  // MARK: - Class Properties
  
  let realm: Realm!
  
  // MARK: - Class Init
  
  init(realm: Realm) {
    self.realm = realm
  }
  
}

extension KamuBookRepository: RepositoryProtocol {
  
  func getAll() -> [KamuBook] {
    
    let questionsObjArray = realm.objects(KamuBookObject.self)
    
    let questions: [KamuBook] = questionsObjArray.compactMap({
      $0.kamuBook
    })
    
    return questions
  }
  
  func get(identifier: Int) -> KamuBook? {
    
    let questionsObjArray = realm.objects(KamuBookObject.self)
    
    let questions: [KamuBook] = questionsObjArray.compactMap({
      $0.kamuBook
    })
    
    return questions.first
  }
  
  func create(a: KamuBook) -> Bool {
    
    do {
      try realm.write {
        realm.add(a.object, update: true)
      }
    } catch {
      return false
    }
    
    return true
  }
  
  func update(a: KamuBook) -> Bool {
    
    do {
      try realm.write {
        realm.add(a.object, update: true)
      }
    } catch {
      return false
    }
    
    return true
  }
  
  func delete(a: KamuBook) -> Bool {
    
    do {
      
      try realm.write {
        
        let obj = realm.objects(KamuBookObject.self).first
        
        if let obj = obj {
          realm.delete(obj)
        }
      }
      
    } catch {
      // handle error
      return false
    }
    
    return true
  }
  
  func deleteAll() -> Bool {
    
    do {
      try realm.write {
        realm.deleteAll()
      }
    } catch {
      return false
    }
    
    return true
  }
  
  func getObjectsCount() -> Int {
    return realm.objects(KamuBookObject.self).count
  }
  
}
