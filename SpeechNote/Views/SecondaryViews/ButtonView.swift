
import SwiftUI

struct ButtonView: View {
    
    
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
            
            VStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "record.circle")
                        .font(.system(size: 50))
                        .foregroundColor(Color(.beige))
                })
                
                Text("Recording")
            }
            
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
