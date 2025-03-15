//
//  ContentView.swift
//  banking
//
//  Created by Andelson on 9/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSplash = true
    
    var body: some View {
        ZStack {
            PostSplashView()
                .opacity(isShowingSplash ? 0 : 1)
                .zIndex(0)
            
            SplashView()
                .opacity(isShowingSplash ? 1 : 0)
                .zIndex(1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .onAppear {
            // set a timer to change the state to show a different view after 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.easeInOut(duration: 0.7)) {
                    isShowingSplash = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
