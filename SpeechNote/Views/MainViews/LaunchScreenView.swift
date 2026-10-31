
import SwiftUI

struct LaunchScreenView: View {
    @State private var isLoaded = false
    var body: some View {
        if isLoaded{
            HomeScreen()
        } else {
            ZStack{
                LinearGradient(colors: [backgroundColor, lightGreen, beige], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack{
                Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 100, maxHeight: 100)
                        .padding()
                    Text("Loading...")
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                }
                
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation{
                        isLoaded = true
                    }
                }
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
