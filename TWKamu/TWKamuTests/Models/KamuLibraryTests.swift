import Foundation

import Quick
import Nimble

@testable import TWKamu

// Testing the vehicle
class KamuLibraryTests: QuickSpec {
  
  // MARK: - Class Properties
  
  // MARK: - Spec
  
  override func spec() {
    
    testKamuLibraryNilInit()
    testKamuLibraryCustomInit()
    testKamuLibraryAdapter()

  }
  
  // MARK: - Tests
  
  private func testKamuLibraryNilInit() {
    
    let expextedId = -1
    
    describe("A KamuLibrary") {
      context("afeter being initialized with no parametes") {
        let mockModel = KamuLibrary()
        it("shoud have an invalid id") {
          expect(mockModel.id) == expextedId
        }
      }
    }
    
  }
  
  private func testKamuLibraryCustomInit() {
    
    let expextedId = 1
    
    describe("A KamuLibrary") {
      context("afeter being initialized with custom parametes as id = 1") {
        let mockModel = KamuLibrary(cityName: "", id: 1)
        it("shoud have a valid id") {
          expect(mockModel.id) == expextedId
        }
      }
    }
  }
  
  private func testKamuLibraryAdapter() {
    
    describe("A KamuLibrary with id = 1") {
      context("when the user gets the object property") {
        let mockModel = KamuLibrary(cityName: "", id: 1)
        it("shoud return a KamuLibraryObject with id = 1") {
          expect(mockModel.object.id) == 1
        }
      }
    }
  }
  
  // MARK: - Auxiliar Mehtods
  
  private func openLibraryJSON() -> [[String: Any]]? {
    
//    if let url = Bundle.main.url(forResource: "quizMock", withExtension: "json") {
//      do {
//        let data = try Data(contentsOf: url)
//        let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
//        return json as? [[String: Any]]
//      } catch {
//        return nil
//      }
//    }
   return nil
  }
  
}
