import SwiftUI

struct MenuView: View {
    @State private var showLanguages = false
    @State private var showAbout = false
    @AppStorage("selectedLanguage") private var selectedLanguage = "en-US"
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
        Menu {
            Button {
                showLanguages = true
            } label: {
                Label("Select Language", systemImage: "globe")
            }

            Button {
                showAbout = true
            } label: {
                Label("About", systemImage: "info.circle")
            }

            Divider()

            Button {
                // Action for Help or Feedback
            } label: {
                Label("Help & Feedback", systemImage: "questionmark.circle")
            }
        } label: {
            Image(systemName: "line.3.horizontal")
                .font(.title3)
                .foregroundStyle(.primary)
                .padding(10)
                .background(Color(.secondarySystemBackground))
                .clipShape(Circle())
        }
        .sheet(isPresented: $showLanguages) {
            NavigationView {
                List(languages, id: \.1) { language in
                    Button(action: {
                        // 1. Αποθηκεύουμε την επιλογή του χρήστη
                        selectedLanguage = language.1
                        // 2. Κλείνουμε το sheet αυτόματα
                        showLanguages = false
                    }) {
                        HStack {
                            Text(language.0) // Το όνομα (π.χ. "Ελληνικά")
                                .font(.body)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            // Αν αυτή είναι η επιλεγμένη γλώσσα, δείξε ένα checkmark (προαιρετικά)
                            if selectedLanguage == language.1 {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                .navigationTitle("Select Language")
            }
        }
        .sheet(isPresented: $showAbout) {
            ZStack {
                Image("logo")
                    .opacity(0.1)
                VStack {
                    Text("About SpeechNote")
                        .font(.title)
                    Text("SpeechNote is a minimal speech-to-text voice note application designed to effortlessly capture your thoughts. By turning live audio directly into plain text documents, Noted lets you dictate ideas, meeting notes, and reminders hands-free, keeping everything organized and saved right on your device.")
                        .multilineTextAlignment(.center)
                }
                .padding()
                .frame(maxWidth: 400)
            }
        }
    }
}

#Preview {
    MenuView()
}
