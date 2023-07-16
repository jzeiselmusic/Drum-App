//
//  PlayerDelegate.swift
//  Drum-App
//
//  Created by Jacob Zeisel on 7/16/23.
//

import Foundation

import AVFoundation

class PlayerDelegate: NSObject, AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            print("Playing finished successfully!")
            // Perform any additional actions you want to take after the recording finishes
        } else {
            print("Playing finished with an error.")
        }
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("player decode error")
    }
}
