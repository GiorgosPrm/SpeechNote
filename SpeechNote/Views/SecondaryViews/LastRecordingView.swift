
import SwiftUI
import Combine
import AVFoundation

struct LastRecordingView: View {
    @State private var recordings: [URL] = []
    @StateObject private var rec = MicrophoneAccess()
    
    var body: some View {
        HStack(spacing: 110) {
            Text("Previews Recordings")
            Button(action: {
                
            }, label: {
                Text("View all")
            })
        }
        
        if let url = rec.recordingsFile{
            Text("File: \(url.lastPathComponent)")
                .font(.footnote)
                .lineLimit(1)
                .truncationMode(.middle)
        }
        
        List{
            Section("Recordings") {
                ForEach(recordings, id: \.self){url in
                    HStack{
                        Text(url.lastPathComponent)
                            .font(.footnote)
                            .lineLimit(1)
                            .truncationMode(.middle)
                    }
                }
            }
        }
    }
}

struct LastRecordingView_Previews: PreviewProvider {
    static var previews: some View {
        LastRecordingView()
    }
}
