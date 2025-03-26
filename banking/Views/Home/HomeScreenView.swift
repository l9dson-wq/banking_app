//
//  HomeScreenView.swift
//  banking
//
//  Created by Andelson on 16/3/25.
//

import SwiftUI

struct HomeScreenView: View {
    /// -------------------------------------------------------------------------->
    /// --> To know what tab is being seleted by the user.
    @State private var selectedTab: Int8 = 0
    /// --> This variable is used to show the side menu or not.
    @State private var isShowingMenu: Bool = false
    /// -------------------------------------------------------------------------->
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // MARK: - Main Content
                VStack(spacing: 0) {
                    // Header section ----------------->
                    HStack {
                        Button(action: {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                self.isShowingMenu.toggle()
                            }
                        }) {
                            Image("ilya")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .zIndex(2) // Keep header on top
                    
                    // Tab view section ----------------->
                    TabView(selection: $selectedTab) {
                        // Introduce the available tabs down here. -->
                        
                        // Home view.
                        HomeView(isShowingMenu: $isShowingMenu)
                            .tabItem {
                                Image(systemName: "house.fill", variableValue: 1.00)
                                    .symbolRenderingMode(.monochrome)
                                    .foregroundColor(Color.accentColor)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .tag(0)
                        
                        // Card view.
                        CardHomeView()
                            .tabItem {
                                Image(systemName: "creditcard", variableValue: 1.00)
                                    .symbolRenderingMode(.monochrome)
                                    .foregroundColor(Color.accentColor)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .tag(1)
                        
                        // Activities view.
                        ActivitiesView()
                            .tabItem {
                                Image(systemName: "lightbulb.min.fill", variableValue: 1.00)
                                    .symbolRenderingMode(.monochrome)
                                    .foregroundColor(Color.accentColor)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .tag(2)
                    }
                    .zIndex(0) // Content behind overlay
                }
                
                // MARK: - Overlay (Single Layer)
                // Using a single overlay layer for both areas to ensure synchronized animation
                if isShowingMenu {
                    Color.black
                        .opacity(0.5)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                isShowingMenu = false
                            }
                        }
                        .animation(.easeInOut(duration: 0.3), value: isShowingMenu)
                        .zIndex(1) // Between content and side menu
                        .transition(.opacity)
                }
                
                // MARK: - Side Menu
                SideMenuView(isShowingMenu: $isShowingMenu)
                    .frame(width: 280)
                    .background(
                        Rectangle()
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 3, y: 0)
                    )
                    .offset(x: isShowingMenu ? 0 : -280)
                    .animation(.spring(response: 0.3, dampingFraction: 0.8), value: isShowingMenu)
                    .zIndex(3) // Always on top
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}
#Preview {
    HomeScreenView()
}
