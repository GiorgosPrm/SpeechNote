import SwiftUI

struct NowRecordingView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    //NoteEditorView()
                } label: {
                    RecordingButtonView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                PreviewsNotesView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    MenuView()
                }
            }
        }
    }
}

struct NowRecordingView_Previews: PreviewProvider {
    static var previews: some View {
        NowRecordingView()
    }
}
