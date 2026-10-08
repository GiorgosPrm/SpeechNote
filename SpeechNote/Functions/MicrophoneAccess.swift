
import Combine
import AVFoundation
import Foundation

final class MicrophoneAccess: ObservableObject {
    @Published var isRecording: Bool = false
    
    //Allows to capture audio
    private var recorder: AVAudioRecorder?
    
    //Saving recording files
    private(set) var recordingsFile: URL?
    
    func requestPermission(_ done: @escaping(Bool)-> Void){
        if #available(iOS 17.0, *){
            AVAudioApplication.requestRecordPermission {
                ok in
                DispatchQueue.main.async {
                    done(ok)
                }
            }
        } else {
            AVAudioSession.sharedInstance().requestRecordPermission {
                ok in
                DispatchQueue.main.async {
                    done(ok)
                }
            }
        }
    }
    
    func startRecording() {
            requestPermission { [weak self] granted in
                guard let self = self, granted else {
                    print("Access not granted")
                    return
                }
                
                do {
                    // Stop any existing recording session safely
                    if self.recorder?.isRecording == true {
                        self.recorder?.stop()
                    }
                    
                    // Configure audio session
                    let session = AVAudioSession.sharedInstance()
                    try session.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker])
                    try session.setActive(true)
                    
                    let dir = try FileManager.default
                        .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                        .appendingPathComponent("Recordings", isDirectory: true)
                    
                    try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
                    
                    let stamp = ISO8601DateFormatter().string(from: .now).replacingOccurrences(of: ":", with: "-")
                    let url = dir.appendingPathComponent("\(stamp).m4a")
                    self.recordingsFile = url
                    
                    let settings: [String: Any] = [
                        AVFormatIDKey: kAudioFormatMPEG4AAC,
                        AVSampleRateKey: 44_100,
                        AVNumberOfChannelsKey: 1,
                        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
                    ]
                    
                    // Initialize recording
                    self.recorder = try AVAudioRecorder(url: url, settings: settings)
                    self.recorder?.isMeteringEnabled = true
                    
                    // Prepare hardware buffers before recording starts
                    self.recorder?.prepareToRecord()
                    
                    if self.recorder?.record() == true {
                        self.isRecording = true
                    } else {
                        print("Failed to start recording hardware session")
                    }
                } catch {
                    print("Start Failed: \(error)")
                }
            }
        }
    
    func stopRecording() {
        recorder?.stop()
        isRecording = false
        recorder = nil
        
        do {
            try AVAudioSession.sharedInstance().setActive(false)
            print("Recording stopped.")
        } catch {
            print("Failed to deactivate audio session: \(error.localizedDescription)")
        }
}
}
