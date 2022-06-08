
import SwiftUI

extension Org.UI.Countries.View {
  typealias NavigationDestination = Org.Routing.NavigationDestination

  /// The navigation container responsible of display view content and route to a destination when is activated.
  struct Navigation<Content: SwiftUI.View>: SwiftUI.View {
    @Binding var isActive: Bool
    
    @Binding var destination: NavigationDestination?
    
    @ViewBuilder let content: Content
    
    var body: some SwiftUI.View {
      ZStack {
        if let destination = destination {
          switch destination.present {
          case .show:
            NavigationLink(isActive: $isActive) {
              destination
            } label: {
              EmptyView()
            }
            
          case .modal:
            ZStack {
            }
            .sheet(isPresented: $isActive) {
              destination
            }
          }
        }

        content
          .navigationTitle(Text("Country"))
      }
    }
  }
}

struct TutorialContentNavigation_Previews:
  PreviewProvider {
  @State static var isActive = false
  
  @State static var previewSelection: Org.Routing.NavigationDestination?
  
  static var previews: some View {
    NavigationView {
      Org.UI.Countries.View.Navigation(
        isActive: $isActive,
        destination: $previewSelection) {
          Text("Hello, world!")
        }
    }
  }
}


