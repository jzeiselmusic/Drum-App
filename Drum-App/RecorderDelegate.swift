//
//  RecorderDelegate.swift
//  Drum-App
//
//  Created by Jacob Zeisel on 7/16/23.
//

import AVFoundation

class RecorderDelegate: NSObject, AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            print("Recording finished successfully!")
            // Perform any additional actions you want to take after the recording finishes
        } else {
            print("Recording finished with an error.")
        }
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        print("recorder encode error")
    }
}
