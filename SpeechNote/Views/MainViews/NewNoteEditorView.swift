
import SwiftUI

struct NewNoteEditorView: View {
    @State private var isTranscribing = false
    var body: some View {
        ZStack {
            LinearGradient(colors: [backgroundColor, lightGreen, beige], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ZStack {
                VStack {
                    ZStack (alignment: .leading){
                        BiggerTopWaveView()
                        TopWaveView()
                        HStack(spacing: 60){
                            MenuView()
                            RecordingTimerView(isTranscribing: isTranscribing)
                        }
                    }
                    
                    ZStack {
                        BiggerBottomWaveView()
                        BottomWaveView()
                        NoteEditorView(isTranscribing: $isTranscribing)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NewNoteEditorView()
}
