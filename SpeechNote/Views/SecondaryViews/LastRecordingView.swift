
import SwiftUI

struct LastRecordingView: View {
    var body: some View {
        HStack(spacing: 110) {
            Text("Previews Recordings")
            Button(action: {
                
            }, label: {
                Text("View all")
            })
        }
    }
}

struct LastRecordingView_Previews: PreviewProvider {
    static var previews: some View {
        LastRecordingView()
    }
}
