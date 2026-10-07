
import SwiftUI
import Combine
import AVFoundation

struct ButtonView: View {
    @StateObject private var rec = MicrophoneAccess()
    
    var body: some View {
        HStack (spacing: 40) {
            VStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "pause.circle")
                        .font(.system(size: 50))
                        .foregroundColor(Color(.blue))
                })
                
                Text("Pause")
            }
            
            VStack {
                Button(action: {
                    if rec.isRecording{
                        rec.stopRecording()
                    } else {
                        rec.startRecording()
                    }
                }, label: {
                    Image(systemName: rec.isRecording
                          ? "stop.circle.fill"
                          : "record.circle")
                        .font(.system(size: 50))
                        .foregroundStyle(rec.isRecording ? .red : Color(.beige))
                })
                
                Text(rec.isRecording ? "Stop" : "")
            }
            
            VStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 50))
                        .foregroundColor(Color(.blue))
                })
                
                Text("New")
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
