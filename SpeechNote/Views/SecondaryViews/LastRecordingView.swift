import SwiftUI
import Combine
import AVFoundation

struct LastRecordingView: View {
    @State private var recordings: [URL] = []
    @StateObject private var rec = MicrophoneAccess()
    
    var body: some View {
        VStack {
            HStack(spacing: 110) {
                Text("Previews Recordings")
                Button(action: {
                    
                }, label: {
                    Text("View all")
                })
            }
            
            if let url = rec.recordingsFile {
                Text("File: \(url.lastPathComponent)")
                    .font(.footnote)
                    .lineLimit(1)
                    .truncationMode(.middle)
            }
            
            List {
                Section("Recordings") {
                    ForEach(recordings, id: \.self) { url in
                        HStack {
                            Text(url.lastPathComponent)
                                .font(.footnote)
                                .lineLimit(1)
                                .truncationMode(.middle)
                        }
                    }
                }
            }
        }
        .padding()
        .task {
            rec.requestPermission { _ in }
            recordings = recordingList()
        }
        .onChange(of: rec.recordingsFile){
            recordings = recordingList()
        }
    }
    
    func recordingList() -> [URL] {
        let dir = try? FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("Recordings", isDirectory: true)
        
        guard let dir, let files = try?
                FileManager.default.contentsOfDirectory(at: dir, includingPropertiesForKeys: nil) else { return [] }
        return files.filter { $0.pathExtension == "m4a" }.sorted { $0.lastPathComponent > $1.lastPathComponent }
    }
}

struct LastRecordingView_Previews: PreviewProvider {
    static var previews: some View {
        LastRecordingView()
    }
}
