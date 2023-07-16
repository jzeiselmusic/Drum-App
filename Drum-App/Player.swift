//
//  Player.swift
//  Drum-App
//
//  Created by Jacob Zeisel on 7/16/23.
//
import Foundation
import AVFoundation

class Player {
    
    var isPlaying: Bool = false
    let myPlayerDelegate = PlayerDelegate()
    var audioPlayer = AVAudioPlayer()
    
    func playRecording() {
        print("attempting to play recording")
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.wav")
        
        if FileManager.default.fileExists(atPath: audioFilename.path) {
            print("file found")
        } else {
            print("file not found")
        }

        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker])
            try audioSession.setActive(true)
            var boolOut: Bool
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioFilename.path))
            audioPlayer.volume = 1.0
            audioPlayer.rate = 44100.0
            audioPlayer.delegate = myPlayerDelegate
            
            boolOut = audioPlayer.play()
            if (boolOut == true) {
                print("playing audio")
            } else {
                print("audio playback error: play returned false")
            }
        } catch {
            print("audio playback error")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
