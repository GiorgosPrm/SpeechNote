
import SwiftUI

struct HomeScreen: View {
    @State private var showLanguages = false
    @State private var showAbout = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [backgroundColor, lightGreen, beige], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .glassEffect(in: .rect(cornerRadius: 20.0))
                    .ignoresSafeArea()
                
                VStack (alignment: .leading) {
                    
                    MenuView()
                    
                    GlassEffectContainer(spacing: 20) {
                        VStack (spacing: 20){
                            NavigationLink {
                                NewNoteEditorView()
                            } label: {
                                RecordingButtonView()
                            }
                            .buttonStyle(.plain)
                            Spacer()
                            PreviewsNotesView()
                        }
                        .padding()
                    }
                    
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .toolbarBackground(.hidden, for: .navigationBar)
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
