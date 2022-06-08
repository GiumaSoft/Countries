
import Apollo
import SwiftUI


extension Org.Model {
  /// The country model.
  struct Country: Identifiable, Hashable {
    /// The country code.
    let code: String
    /// The country name.
    let name: String
    /// The country capital city.
    let capital: String?
    /// The flag emoji.
    let emoji: String
    /// The currencies supported in the country.
    let currencies: [String]
    /// The languages used in the country.
    let languages: [String]
    /// The states of the country.
    let states: [String]
    /// The id required by Identifiable protocol.
    var id: String {
      code
    }
  }
}

extension Org.Model.Country: InitializableWithGraphQLResult {
  /// Failable intializer attempt to create an Country model from GraphQL query result.
  init?(result: GraphQLResult<CountryQuery.Data>) {
    guard
      let country = result.data?.country
    else {
      
      return nil
    }
    
    self.init(
      code: country.code,
      name: country.name,
      capital: country.capital,
      emoji: country.emoji,
      currencies: country
        .currency?
        .components(
          separatedBy: ","
        ) ?? [],
      languages: {
        var languages = [String]()
        for language in country.languages {
          if let languageName = language.name {
            languages.append(languageName)
          }
        }
        
        return languages
      }(),
      states: {
        var states = [String]()
        for state in country.states {
          states.append(state.name)
        }
        
        return states
      }()
    )
  }
}

extension Array: InitializableWithGraphQLResult where Element == Org.Model.Country {
  /// Failable intializer attempt to create an array of Country model from GraphQL query result.
  init?(result: GraphQLResult<CountriesQuery.Data>) {
    guard
      let data = result.data
    else {
      
      return nil
    }
    
    var countries = [Org.Model.Country]()
    for country in data.countries {
      countries.append(
        Org.Model.Country(
          code: country.code,
          name: country.name,
          capital: nil,
          emoji: country.emoji,
          currencies: [],
          languages: [],
          states: [])
      )
    }
    self = countries
  }
}
