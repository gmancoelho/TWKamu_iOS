//
//  KamuRepositoriesInterface.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 16/08/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

protocol RepositoryProtocol {
  
  associatedtype TypeT
  
  func getAll() -> [TypeT]
  func get(identifier: Int ) -> TypeT?
  func create(a: TypeT) -> Bool
  func update(a: TypeT) -> Bool
  func delete(a: TypeT) -> Bool
  func deleteAll() -> Bool
  func getObjectsCount() -> Int
}
