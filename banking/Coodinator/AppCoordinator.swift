//
//  AppCoordinator.swift
//  banking
//
//  Created by Andelson on 16/3/25.
//

import SwiftUI

class AppCoordinator: ObservableObject {
    // I can have a logic here to verify if the user is already logged in the app
    @Published var userLogged: Bool = true
    @Published var currentScreen: AppScreen = .splashView
    
    init() {
        // set the initial screen on the initializer of the class.
        setInitialScreen()
    }
    
    private func setInitialScreen() {
        // if the user is not logged then send the user to the splash vie (login process)
        if !userLogged {
            currentScreen = .splashView
            return
        }
        
        currentScreen = .home
    }
    
    func navigateTo(_ screen: AppScreen) {
        currentScreen = screen
    }
    
    func goBack() {
        currentScreen = .home
    }
}

extension AppCoordinator {
    enum AppScreen {
        case home // home view (inside the app)
        case search
        case details
        case login // User choose to log in with email.
        case onboarding // Log in options.
        case splashView // Splash initial view.
    }
}
