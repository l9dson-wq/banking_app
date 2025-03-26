//
//  CoordinatedView.swift
//  banking
//
//  Created by Andelson on 16/3/25.
//

import SwiftUI

struct CoordinatedView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        Group {
            switch coordinator.currentScreen {
            case .login:
                LoginView()
            case .onboarding:
                PostSplashView()
            case .home:
                HomeScreenView()
            case .search:
                HomeScreenView()
            case .details:
                HomeScreenView()
            case .splashView:
                PostSplashView()
            }
        }
    }
}
