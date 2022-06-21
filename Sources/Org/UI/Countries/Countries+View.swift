
import SwiftUI

extension Org.UI.Countries {
  struct View: SwiftUI.View {
    
    @State var state: LocalState
    
    var body: some SwiftUI.View {
      Navigation(
        isActive: $state.isActive,
        destination: $state.destination,
        errorMessage: $state.errorMessage
      ) {
        List(
          state.countries,
          id: \.self
        ) { country in
          VStack(
            alignment: .leading,
            spacing: 0
          ) {
            HStack {
              Text(country.emoji)
                .modifier(Modifier.MediumEmoji())
              Text(country.name)
            }
            .onTapGesture {
              Task {
                await ViewModel.fetchCountry(
                  withCode: country.code) { country in
                    state.destination = .country(
                      country
                    )
                    state.isActive = true
                  } onError: { error in
                    state.errorMessage = error.localizedDescription
                  }
              }
            }
            
            Divider()
              .modifier(Modifier.StandardDivider())
          }
          .modifier(Modifier.DefaultListItem())
        }
        .onAppear {
          Task {
            state.countries = await ViewModel.fetchCountries { error in
              state.errorMessage = error.localizedDescription
            }
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
