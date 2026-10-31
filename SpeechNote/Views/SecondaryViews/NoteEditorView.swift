import AVFoundation
import SwiftUI
import SwiftData

struct NoteEditorView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var recognizer = SpeechRecognizer()
    @State private var noteText: String = ""
    @Binding var isTranscribing: Bool
    @AppStorage("selectedLanguage") private var selectedLanguage: String = "en-US"
    @State private var showLanguages = false
    
    // Λίστα διαθέσιμων γλωσσών
    let languages = [
        ("Ελληνικά", "el-GR"),
        ("English (US)", "en-US"),
        ("English (UK)", "en-GB"),
        ("Français", "fr-FR"),
        ("Deutsch", "de-DE"),
        ("Español (España)", "es-ES"),
        ("Italiano", "it-IT"),
        ("Português (Portugal)", "pt-PT"),
        ("日本語", "ja-JP"),
        ("中文 (简体)", "zh-CN")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            TextEditor(text: $noteText)
                .padding()
                .border(Color.gray.opacity(0.3), width: 1)
                .frame(maxHeight: .infinity)
            
            if isTranscribing {
                Text("Listening: \(recognizer.transcript)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
            }
            
            Button(action: toggleTranscription) {
                VStack {
                    Image(systemName: isTranscribing ? "stop.circle.fill" : "mic.circle.fill")
                        .font(.title)
                    Text(isTranscribing ? "Stop" : "Start Recording")
                        .bold()
                }
                .foregroundColor(.white)
                .padding()
                .background(isTranscribing ? Color.red : Color.blue)
                .cornerRadius(20)
            }
        }
        .padding()
        .onChange(of: recognizer.transcript) { _, newTranscript in
            if isTranscribing && !newTranscript.isEmpty {
                noteText = newTranscript
            }
        }
    }
    
    private func toggleTranscription() {
        if isTranscribing {
            recognizer.stopTranscribing()
            
            // Append remaining transcript
            if !recognizer.transcript.isEmpty {
                noteText = recognizer.transcript
            }
            
            // Save to local disk via SwiftData
            if !noteText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                let newNote = Note(content: noteText)
                modelContext.insert(newNote)
            }
            
            isTranscribing = false
        } else {
            noteText = ""
            recognizer.resetTranscript()
            recognizer.startTranscribing(languageCode: selectedLanguage)
            isTranscribing = true
        }
    }
}

#Preview {
    NoteEditorView(isTranscribing: .constant(false))
        .modelContainer(for: Note.self, inMemory: true)
}
