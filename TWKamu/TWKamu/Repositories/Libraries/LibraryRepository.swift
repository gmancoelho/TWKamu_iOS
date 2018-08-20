//
//  LibraryRepository.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 16/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation
import RealmSwift

final class LibraryRepository {
  
  // MARK: - Class Properties
  
  let realm: Realm!
  
  // MARK: - Class Init
  
  init(realm: Realm) {
    self.realm = realm
  }
  
}

extension LibraryRepository: RepositoryProtocol {
  
  func getAll() -> [KamuLibrary] {
    
    let questionsObjArray = realm.objects(KamuLibraryObject.self)
    
    let questions: [KamuLibrary] = questionsObjArray.compactMap({
      $0.kamuLibrary
    })
    
    return questions
  }
  
  func get(identifier: Int) -> KamuLibrary? {
    
    let questionsObjArray = realm.objects(KamuLibraryObject.self)
    
    let questions: [KamuLibrary] = questionsObjArray.compactMap({
      $0.kamuLibrary
    })
    
    return questions.first
  }
  
  func create(a: KamuLibrary) -> Bool {
    
    do {
      try realm.write {
        realm.add(a.object, update: true)
      }
    } catch {
      return false
    }
    
    return true
  }
  
  func update(a: KamuLibrary) -> Bool {
    
    do {
      try realm.write {
        realm.add(a.object, update: true)
      }
    } catch {
      return false
    }
    
    return true
  }
  
  func delete(a: KamuLibrary) -> Bool {
    
    do {
      
      try realm.write {
        
        let obj = realm.objects(KamuLibraryObject.self).first
        
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
    return realm.objects(KamuLibraryObject.self).count
  }
  
}
