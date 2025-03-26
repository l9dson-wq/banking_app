//
//  ContentView.swift
//  banking
//
//  Created by Andelson on 9/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSplash = true
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        ZStack {
            if isShowingSplash {
                SplashView()
                    .transition(.opacity)
            } else {
                CoordinatedView()
                    .environmentObject(coordinator)
                    .transition(.opacity)
            }
        }
        .onAppear {
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
