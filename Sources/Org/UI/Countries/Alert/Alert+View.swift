
import SwiftUI

extension Org.UI.Alert {
  struct View: SwiftUI.View {
    @State var state: LocalState
    
    var body: some SwiftUI.View {
      VStack(alignment: .center) {
        Text(state.message)
          .padding()
          .foregroundColor(
            Color.white
          )
          .background(
            Color.red
          )
          .clipShape(
            Capsule()
          )
      }
      .padding()
    }
  }
}

struct AlertView_Previews: PreviewProvider {
  static var previews: some SwiftUI.View {
    Org.UI.Alert.View(
      state: .init(
        message: "This is an alert example."
      )
    )
  }
}
