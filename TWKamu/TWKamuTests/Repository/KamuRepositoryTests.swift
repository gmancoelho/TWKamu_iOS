
import Foundation

import Quick
import Nimble
import RealmSwift

@testable import TWKamu

class KamuRepositoryTests: QuickSpec {
  
  // MARK: - Class Properties
  
  var mockRepo: KamuLibraryRepository!
  
  // MARK: - Spec
  
  override func spec() {
    
    beforeSuite {
      Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }
    
    beforeEach {
      let realm = try! Realm()
      self.mockRepo = KamuLibraryRepository(realm: realm)
      _ = self.mockRepo.deleteAll()
    }
    
    testLibraryRepositoryGetAll()
    testLibraryRepositoryUpdate()
    testLibraryRepositoryQuery()
    testLibraryRepositoryDelete()
  }
  
  // MARK: - Tests
  
  private func testLibraryRepositoryGetAll() {
    
    let realm = try! Realm()

    mockRepo = KamuLibraryRepository(realm: realm)
    
    describe("A LibraryRepository") {
      context("afeter being initialized with no parametes") {
        it("getAll shoud return 0 itens") {
          expect(self.mockRepo.getAll().count) == 0
        }
      }
    }
    
    describe("A LibraryRepository") {
      context("afeter adding one KamuLibrary") {
        it("getAll shoud return 1 item") {
          let modelMock = KamuLibrary()
          _ = self.mockRepo.update(a: modelMock)
          expect(self.mockRepo.getAll().count) == 1
        }
      }
    }
    
    describe("A LibraryRepository") {
      context("afeter adding another KamuLibrary") {
        it("getAll shoud return 2 itens") {
          let modelMock1 = KamuLibrary()
          _ = self.mockRepo.update(a: modelMock1)
          
          let modelMock2 = KamuLibrary(cityName: "", slug: "", books: [], id: 2)
          _ = self.mockRepo.update(a: modelMock2)
          
          expect(self.mockRepo.getAll().count) == 2
        }
      }
    }
  }
  
  private func testLibraryRepositoryUpdate() {
    
    let realm = try! Realm()
    
    mockRepo = KamuLibraryRepository(realm: realm)
    
    describe("A LibraryRepository with only one object with the pk = 1") {
      context("when the user inserts another object with the same PK") {
        it("shoud have only one object after query for all objects") {
          
          let modelMock = KamuLibrary()

          _ = self.mockRepo.update(a: modelMock)
          expect(self.mockRepo.getAll().count) == 1
          
          _ = self.mockRepo.update(a: modelMock)
          expect(self.mockRepo.getAll().count) == 1
          
        }
      }
    }
  }
  
  private func testLibraryRepositoryQuery() {
    
    let realm = try! Realm()
    
    mockRepo = KamuLibraryRepository(realm: realm)

    describe("A LibraryRepository with only one object with the PK = 1") {
      context("when the user query for a object with the PK = 1") {
        it("shoud retrieve only one object with the PK = 1") {
          
          let modelMock = KamuLibrary(cityName: "", slug: "", books: [], id: 2)
          _ = self.mockRepo.update(a: modelMock)
          expect(self.mockRepo.get(identifier: 1)?.id) == 1
          
        }
      }
    }
  }
  
  private func testLibraryRepositoryDelete() {
    
    let realm = try! Realm()
    
    mockRepo = KamuLibraryRepository(realm: realm)

    describe("A LibraryRepository with only one object with the PK = 1") {
      context("when the user deletes the object with the PK = 1") {
        it("shoud retrieve zero objects") {
          
          let modelMock = KamuLibrary(cityName: "", slug: "", books: [], id: 2)

          _ = self.mockRepo.update(a: modelMock)
          expect(self.mockRepo.get(identifier: 1)?.id) == 1
          
          _ = self.mockRepo.delete(a: modelMock)
          expect(self.mockRepo.get(identifier: 1)).to(beNil())
        }
      }
    }
  }
  
}
