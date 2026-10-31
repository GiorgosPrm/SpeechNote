
import SwiftUI

struct BiggerBottomWaveView: View {
    @State var percent = 72.0
    @State var waveOffset = Angle(degrees: 0)
    
    var body: some View {
        ZStack{
            Wave(offset: Angle(degrees: waveOffset.degrees), percent: percent)
                .fill(Color.gray)
                .ignoresSafeArea()
        }
        .onAppear{
            withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)){
                self.waveOffset = Angle(degrees: 360)
            }
        }
    }
}

struct BiggerWave: Shape {
    
    var offset: Angle
    var percent: Double
    
    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue) }
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
         
        let lowestWave = 0.02
        let highestWave = 1.00
         
        let newPercent = lowestWave + (highestWave - lowestWave) * (percent / 100)
        let waveHeight = 0.015 * rect.height
        let yOffset = CGFloat(1 - newPercent) * (rect.height + 4 * waveHeight)
        
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360 + 10)
         
        p.move(to: CGPoint(x: 0, y: yOffset + waveHeight * CGFloat(sin(offset.radians))))
         
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            p.addLine(to: CGPoint(x: x, y: yOffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        
        p.addLine(to: CGPoint(x: rect.width, y: rect.height))
        p.addLine(to: CGPoint(x: 0, y: rect.height))
        p.closeSubpath()
         
        return p
    }
}

struct BiggerWaveView_Previews: PreviewProvider {
    static var previews: some View {
        BottomWaveView()
    }
}
