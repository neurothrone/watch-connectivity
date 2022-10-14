//
//  ContentView.swift
//  WatchConnectivityCortex Watch App
//
//  Created by Zaid Neurothrone on 2022-10-14.
//

import SwiftUI

struct ContentView: View {
  @StateObject var connectivity: Connectivity = .init()
  
  var body: some View {
    VStack {
      Text(connectivity.receivedText)
      Button("Message", action: sendMessage)
    }
  }
}

extension ContentView {
  func sendMessage() {
    let data = ["text": "Hello from the watch"]
    connectivity.transferUserInfo(data)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
