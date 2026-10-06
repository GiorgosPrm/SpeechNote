
import SwiftUI

struct RecordingButtonView: View {
    var body: some View {
        VStack {
            
            Text("Tap to record")
                .font(.title.bold())
                .foregroundColor(.black)
            
            Button(action: {
                
            }, label: {
                Image(systemName: "mic.fill")
                    .font(.system(size: 80, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(50)
                    .background(
                        Circle()
                            .fill(.darkBlue)
                        )
            })
        }
    }
}

struct RecordingButtonView_Preview: PreviewProvider {
    static var previews: some View {
        RecordingButtonView()
    }
}
