import SwiftUI
import SwiftData

struct PreviewsNotesView: View {
    @Query(sort: \Note.createdAt, order: .reverse) private var notes: [Note]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        // Remove the nested NavigationStack if it's already inside a NavigationStack in HomeScreen,
        // or keep it and make its background transparent. Here, we clear the list backgrounds:
        Group {
            List {
                if notes.isEmpty {
                    ContentUnavailableView(
                        "No Notes Yet",
                        systemImage: "note.text",
                        description: Text("Transcribe speech in the editor to create your first note.")
                    )
                    .listRowBackground(Color.clear) // Makes the empty state row transparent
                } else {
                    Section("Saved Notes") {
                        ForEach(notes) { note in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(note.content)
                                    .font(.body)
                                    .lineLimit(3)
                                 
                                Text(note.createdAt.formatted(date: .abbreviated, time: .shortened))
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                        .onDelete(perform: deleteNotes)
                    }
                    .listRowBackground(Color.clear) // Makes each list cell/row transparent
                }
            }
            .scrollContentBackground(.hidden) // Hides the default list background color
            .background(.clear) // Ensures the list itself is transparent
        }
    }
    
    private func deleteNotes(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(notes[index])
        }
    }
}

#Preview {
    PreviewsNotesView()
        .modelContainer(for: Note.self, inMemory: true)
}
