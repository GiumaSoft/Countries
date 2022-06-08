
import Foundation
import Apollo

/// Adopter support initialization from a `GraphQLResult<Data>`
protocol InitializableWithGraphQLResult {
  /// Represent a GraphQLSelectionSet of data.
  associatedtype Data: GraphQLSelectionSet
  /// Responsible to `initialize Self` `from a GraphQL` query result
  init?(result: GraphQLResult<Data>)
}
