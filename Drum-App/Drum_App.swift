//
//  Drum_AppApp.swift
//  Drum-App
//
//  Created by Jacob Zeisel on 7/14/23.
//

import SwiftUI
import AVFoundation

let newRecorder = Recorder()
let newPlayer = Player()

@main
struct Drum_App: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        print("initializing")
        
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playAndRecord, mode: .default, options: [])
            try session.setActive(true)
            session.requestRecordPermission { (allowed) in
                DispatchQueue.main.async {
                    if allowed {
                        print("permission granted")
                    } else {
                        print("permission denied")
                    }
                }
            }
        } catch {
            print("configuration error")
        }
    }
}
