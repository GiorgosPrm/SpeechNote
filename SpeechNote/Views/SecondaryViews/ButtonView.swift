
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
            
            //NoteEditorView(isTranscribing: )
            
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
