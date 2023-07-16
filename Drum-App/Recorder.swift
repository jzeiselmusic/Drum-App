//
//  Recorder.swift
//  Drum-App
//
//  Created by Jacob Zeisel on 7/15/23.
//

import Foundation
import AVFoundation

class Recorder {
    
    var isRecording: Bool = false
    let myRecorderDelegate = RecorderDelegate()
    var audioRecorder = AVAudioRecorder()
    
    func setRecording(val: Bool) {
        isRecording = val
    }
    
    func getRecording() -> Bool {
        return isRecording
    }
    
    func startRecording() {
        /* get path to documents directory in ios */
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.wav")

        /* set settings for new recording */
        let settings = [
            AVFormatIDKey: Int(kAudioFormatLinearPCM),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ] as [String : Any]

        /* try to start a new recording */
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            /* set this object to be the delegate for audio recording */
            audioRecorder.delegate = myRecorderDelegate
            let boolOut = audioRecorder.record(forDuration: 4)
            if (boolOut == true) {
                setRecording(val:true)
                print("Recording started")
            }
            else {
                print("error starting recording")
            }
        } catch {
            print("Recording failed: \(error)")
            setRecording(val:false)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func stopRecording() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setActive(false, options: .notifyOthersOnDeactivation)
            setRecording(val:false)
            print("Recording stopped")
        } catch {
            print("failed to stop recording")
            setRecording(val:true)
        }
    }
}
