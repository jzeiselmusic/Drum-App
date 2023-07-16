//
//  ContentView.swift
//  Drum-App
//
//  Created by Jacob Zeisel on 7/14/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    // Code to be executed when the button is tapped
                    print("Attempting to start recording")
                    newRecorder.startRecording()
                }) {
                    Text("Record")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(15)
                }
                
            Spacer()
            
            VStack {
                
                Button(action: {
                    newPlayer.playRecording()
                }) {
                    Text("Play")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                }
            }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
