
import SwiftUI

extension Org.UI.Countries.Country {
  struct View: SwiftUI.View {
    @State var state: LocalState

    var body: some SwiftUI.View {
      VStack(alignment: .leading, spacing: 18) {
        HStack {
          Text(state.country.emoji)
            .modifier(Modifier.LargeEmoji())
          Text(state.country.name)
            .modifier(Modifier.Heading())
          Spacer()
        }
        If(state.country.capital) {
          Text("Capital is ") + Text($0).bold()
        }
        If(state.country.currencies) { currencies in
          ViewModel.simpleOrPlural(currencies) {
            Text("Currency is")
          } plural: {
            Text("Currencies are")
          }
          ScrollView(.horizontal) {
            HStack {
              ForEach(currencies, id: \.self) { currency in
                Text(currency)
                  .modifier(Modifier.TagElement())
              }
            }
          }
        }
        If(state.country.languages) { languages in
          ViewModel.simpleOrPlural(languages) {
            Text("Language is")
          } plural: {
            Text("Languages are")
          }
          ScrollView(.horizontal) {
            HStack {
              ForEach(languages, id: \.self) { language in
                Text(language)
                  .modifier(Modifier.TagElement())
              }
            }
          }
        }
        If(state.country.states) { states in
          ViewModel.simpleOrPlural(states) {
            Text("State of the country is")
          } plural: {
            Text("States of the country are")
          }
          ScrollView(.horizontal) {
            HStack {
              ForEach(states, id: \.self) { state in
                Text(state)
                  .modifier(Modifier.TagElement())
              }
            }
          }
        }
        Spacer()
      }
      .padding()
      .navigationTitle("Country")
    }
  }
}


struct CountriesCountryView_Previews: PreviewProvider {
  static var previews: some SwiftUI.View {
      NavigationView {
        Org.UI.Countries.Country.View(
          state: .init(
            country: Org.Model.Country(
              code: "AD",
              name: "Andorra",
              capital: "Andorra la Vella",
              emoji: "🇦🇩",
              currencies: ["EUR"],
              languages: ["Catalan"],
              states: [])
          )
        )
      }
    }
}

// MARK: - Private Typealias

fileprivate typealias Modifier = Org.Style.Modifier
fileprivate typealias ViewModel = Org.UI.Countries.Country.ViewModel
