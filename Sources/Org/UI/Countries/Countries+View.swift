
import SwiftUI

extension Org.UI.Countries {
  struct View: SwiftUI.View {
    
    @State var state: LocalState
    
    var body: some SwiftUI.View {
      Navigation(isActive: $state.isActive, destination: $state.destination) {
        List(state.countries, id: \.self) { country in
          VStack(alignment: .leading, spacing: 0) {
            HStack {
              Text(country.emoji)
                .modifier(Modifier.MediumEmoji())
              Text(country.name)
            }
            .onTapGesture {
              Task {
                state.destination = .country(
                  try await ViewModel.fetchCountry(
                    withCode: country.code
                  )
                )
                state.isActive = true
              }
            }
            
            Divider()
              .modifier(Modifier.StandardDivider())
          }
          .modifier(Modifier.DefaultListItem())
        }
        .onAppear {
          Task {
            state.countries = try await ViewModel.fetchCountries()
          }
        }
      }
      .navigationTitle("Countries")
    }
    
    init() {
      self.state = LocalState()
    }
  }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        Org.UI.Countries.View()
      }
    }
}

// MARK: - Private Typealias

fileprivate typealias Modifier = Org.Style.Modifier
fileprivate typealias ViewModel = Org.UI.Countries.ViewModel
