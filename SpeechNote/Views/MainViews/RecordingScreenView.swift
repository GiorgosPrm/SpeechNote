
import SwiftUI

struct RecordingScreenView: View {
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                ButtonView()
            }
        }
    }
}

struct RecordingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingScreenView()
    }
}
