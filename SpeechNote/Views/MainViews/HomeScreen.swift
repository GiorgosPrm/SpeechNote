
import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    RecordingScreenView()
                } label: {
                    RecordingButtonView()
                }
                
                Spacer()
                LastRecordingView()
            }.padding()
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
