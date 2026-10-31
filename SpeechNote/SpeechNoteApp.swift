import SwiftData
import SwiftUI

@main
struct SpeechNoteApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchScreenView()
        }
        .modelContainer(for: Note.self) //Sets local storage
    }
}
