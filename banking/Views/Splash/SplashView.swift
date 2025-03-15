//
//  SplashView.swift
//  banking
//
//  Created by Andelson on 9/3/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("GoldenVault")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.white)
            }
            .padding()
            .frame(maxWidth: .infinity ,maxHeight: .infinity, alignment: .center)
        }
        .background(Color(hex: "09122C"))
    }
}

#Preview {
    SplashView()
}
