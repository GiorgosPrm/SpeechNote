import SwiftUI
import Combine

struct RecordingTimerView: View {
    var isTranscribing: Bool
    
    @State private var timeElapsed: TimeInterval = 0
    @State private var timerCancellable: AnyCancellable? = nil

    var body: some View {
        Text(timeString(timeElapsed))
            .font(.system(size: 36, weight: .semibold, design: .monospaced))
            .foregroundColor(.secondary)
            .onChange(of: isTranscribing) { _, newValue in
                if newValue {
                    startTimer()
                } else {
                    stopAndResetTimer()
                }
            }
    }

    private func startTimer() {
        timeElapsed = 0
        timerCancellable?.cancel() // Clear any existing instance
        
        timerCancellable = Timer.publish(every: 0.05, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                timeElapsed += 0.05
            }
    }

    private func stopAndResetTimer() {
        timerCancellable?.cancel()
        timerCancellable = nil
        timeElapsed = 0
    }

    private func timeString(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let centiseconds = Int((time * 100).truncatingRemainder(dividingBy: 100))
        return String(format: "%02d:%02d.%02d", minutes, seconds, centiseconds)
    }
}
#Preview {
    RecordingTimerView(isTranscribing: false)
}
