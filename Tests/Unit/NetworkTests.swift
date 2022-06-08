
import XCTest
@testable import Countries

class NetworkTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchCountries() async throws {
      // Example of very annoying test function :D
      
      let countries: [Org.Model.Country] = try await Org.Network.Client.fetch(query: CountriesQuery())
      XCTAssert(countries.count > 0)
    }
}
