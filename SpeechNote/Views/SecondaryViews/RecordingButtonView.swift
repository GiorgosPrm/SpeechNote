
import SwiftUI

struct RecordingButtonView: View {
    var body: some View {
        VStack {
            Image(systemName: "mic.fill")
                .font(.system(size: 80, weight: .semibold))
                .foregroundColor(.white)
                .padding(50)
                .background(
                    Circle()
                        .fill(.darkBlue)
                )
            
            Text("Tap to record")
                .font(.title.bold())
                .foregroundColor(.black)
        }
    }
}

struct RecordingButtonView_Preview: PreviewProvider {
    static var previews: some View {
        RecordingButtonView()
    }
}
