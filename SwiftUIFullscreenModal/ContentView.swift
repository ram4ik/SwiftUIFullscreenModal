//
//  ContentView.swift
//  SwiftUIFullscreenModal
//
//  Created by Ramill Ibragimov on 23.06.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isFullScreen = false
    @State private var isNotFullScreen = false
    
    var body: some View {
        HStack {
            Text("Not full screen")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .onTapGesture {
                    isNotFullScreen.toggle()
                }
                .sheet(isPresented: $isNotFullScreen) {
                    NotFullScreen(isNotFullSceen: $isNotFullScreen)
                }
            
            Text("Full screen")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .onTapGesture {
                    isFullScreen.toggle()
                }
                .fullScreenCover(isPresented: $isFullScreen) {
                    FullScreen(isFullSceen: $isFullScreen)
                }
        }
    }
}

struct NotFullScreen: View {
    @Binding var isNotFullSceen: Bool
    
    var body: some View {
        Text("This is not full screen.")
            .onTapGesture {
                self.isNotFullSceen.toggle()
            }
    }
}

struct FullScreen: View {
    @Binding var isFullSceen: Bool
    
    var body: some View {
        Text("This is full screen.")
            .onTapGesture {
                self.isFullSceen.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
