//
//  SideMenuView.swift
//  banking
//
//  Created by Andelson on 19/3/25.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowingMenu: Bool
    
    var body: some View {
        ZStack {
            // Menu background
            Color(UIColor.systemBackground)
            
            // Menu items
            VStack(alignment: .leading, spacing: 0) {
                // User profile section
                VStack(alignment: .leading) {
                    Image("ilya")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
//                        .overlay(
//                            Circle()
//                                .stroke(Color.black, lineWidth: 1)
//                        )
                    
                    Text("Andelson Lopez")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
//                    Text("andelsonnicolas@gmail.com")
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                        .padding(.bottom, 20)
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                // Divider
                Divider()
                    .padding(.vertical, 8)
                
                // Menu options
                MenuOptionRow(iconName: "house.fill", title: "Home")
                MenuOptionRow(iconName: "creditcard.fill", title: "My Cards")
                MenuOptionRow(iconName: "arrow.left.arrow.right", title: "Activity")
                
                Spacer()
                
                // Logout button
                Button(action: {
                    // Logout action
                }) {
                    HStack {
                        Image(systemName: "arrow.left.square")
                            .foregroundColor(.red)
                        
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                    .padding()
                }
                .padding(.bottom, 30)
            }
            .padding(.top, 50)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .ignoresSafeArea(.all, edges: .vertical)
    }
}

// side menu buttons ----->
/// -iconName (system name)
/// -title
struct MenuOptionRow: View {
    let iconName: String
    let title: String
    
    var body: some View {
        Button(action: {
            // Action for this menu item
        }) {
            HStack(spacing: 16) {
                Image(systemName: iconName)
                    .frame(width: 24, height: 24)
                
                Text(title)
                    .font(.body)
                
                Spacer()
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .contentShape(Rectangle())
        }
        .foregroundColor(.primary)
    }
}

#Preview {
    SideMenuView(
        isShowingMenu: .constant(false)
    )
}
