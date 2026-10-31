
import SwiftUI

struct RecordingButtonView: View {
    var body: some View {
            VStack {
                Image(systemName: "mic.fill")
                    .font(.system(size: 80, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(50)
                    .glassEffect()
                
                Text("Tap to record")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
        }
    }
}

struct RecordingButtonView_Preview: PreviewProvider {
    static var previews: some View {
        RecordingButtonView()
    }
}
