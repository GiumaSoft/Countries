
import Apollo

extension Org.UI.Countries {
  /// The view model for country view.
  struct ViewModel {
    /// Fetch countries from a GraphQL service and return an array of country.
    ///
    /// - Returns: A populated array of country model.
    static func fetchCountries() async throws -> [Org.Model.Country] {
      return try await Client.fetch(query: CountriesQuery())
    }
    
    /// Fetch countries from a GraphQL service and return an array of country.
    ///
    /// - Parameters:
    ///   - withCode: A string representing the international country code.
    /// - Returns: A populated country model.
    static func fetchCountry(withCode code: String) async throws -> Org.Model.Country {
      return try await Client.fetch(query: CountryQuery(code: code))
    }
  }
}

fileprivate typealias Client = Org.Network.Client
