
import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack {
            RecordingButtonView()
            Spacer()
            LastRecordingView()
            Spacer()
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
