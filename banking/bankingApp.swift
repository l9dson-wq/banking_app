//
//  bankingApp.swift
//  banking
//
//  Created by Andelson on 9/3/25.
//

import SwiftUI

@main
struct bankingApp: App {
    @StateObject private var coordinator = AppCoordinator()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(coordinator)
        }
    }
}
