
import Apollo

extension Org.UI.Countries {
  /// The view model for country view.
  struct ViewModel {
    /// Fetch countries from a GraphQL service and return an array of country.
    ///
    /// - Returns: A populated array of country models, on error return empty array and trigger completion with error description.
    static func fetchCountries(onError completion: (Error) -> Void) async -> [Org.Model.Country] {
      do {
        return try await Client.fetch(query: CountriesQuery())
      } catch {
        completion(error)
        return []
      }
    }
    
    /// Fetch countries from a GraphQL service and return an array of country.
    ///
    /// - Returns: A populated array of country model.
    static func fetchCountries() async throws -> [Org.Model.Country] {
      try await Client.fetch(query: CountriesQuery())
    }
    
    /// Fetch countries from a GraphQL service and return an array of country.
    ///
    /// - Parameters:
    ///   - withCode: A string representing the international country code.
    /// - Returns: A populated country model.
    static func fetchCountry(withCode code: String) async throws -> Org.Model.Country {
      try await Client.fetch(query: CountryQuery(code: code))
    }

    /// Fetch countries from a GraphQL service and return an array of country.
    ///
    /// - Parameters:
    ///   - withCode: A string representing the international country code.
    /// - Returns: A populated country model, on error return empty model and trigger completion with error description.
    static func fetchCountry(withCode code: String, onSuccess: (Org.Model.Country) -> Void, onError: (Error) -> Void) async {
      do {
        onSuccess(
          try await Client.fetch(query: CountryQuery(code: code))
        )
      } catch {
        onError(error)
      }
    }
  }
}

fileprivate typealias Client = Org.Network.Client
