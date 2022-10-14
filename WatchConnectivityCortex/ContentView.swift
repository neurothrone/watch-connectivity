//
//  ContentView.swift
//  WatchConnectivityCortex
//
//  Created by Zaid Neurothrone on 2022-10-14.
//

import SwiftUI

struct ContentView: View {
  @StateObject var connectivity: Connectivity = .init()
  
  var body: some View {
    VStack(spacing: 30) {
      Text(connectivity.receivedText)
      Button("Message", action: sendMessage)
      Button("Context", action: sendContext)
      Button("File", action: sendFile)
      Button("Complication", action: sendComplication)
    }
  }
}

extension ContentView {
  func sendMessage() {
    let data = ["text": "User info from the phone"]
//    connectivity.transferUserInfo(data)
    connectivity.sendMessage(data)
  }
  
  func sendContext() {
    let data = ["text": "Hello from the phone"]
    connectivity.setContext(to: data)
  }
  
  func sendFile() {
    let fm = FileManager.default
    let sourceURL = URL.documentsDirectory.appending(path: "saved_file")
    
    if !fm.fileExists(atPath: sourceURL.path()) {
      try? "Hello, from a phone file".write(
        to: sourceURL,
        atomically: true,
        encoding: .utf8
      )
    }
    
    connectivity.sendFile(sourceURL)
  }
  
  func sendComplication() {
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
