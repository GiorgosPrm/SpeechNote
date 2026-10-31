import SwiftUI

struct ModernNoteEditor: View {
    @Binding var noteText: String
    
    var body: some View {
            ZStack(alignment: .topLeading) {
                // Placeholder support
                if noteText.isEmpty {
                    Text("Type your thoughts here...")
                        .foregroundColor(.secondary.opacity(0.6))
                        .padding(.top, 12)
                        .padding(.leading, 6)
                }
                
                TextEditor(text: $noteText)
                    .scrollContentBackground(.hidden) // Hides default white/black background in iOS 16+
                    .background(Color.clear)
            }
            .frame(maxHeight: .infinity)
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6)) // Adapts automatically to light/dark mode
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(.separator).opacity(0.5), lineWidth: 0.5)
            )
        
        .padding()
    }
}

#Preview {
    ModernNoteEditor(noteText: .constant("Hi"))
}
