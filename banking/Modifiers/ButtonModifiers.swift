//
//  ButtonModifiers.swift
//  banking
//
//  Created by Andelson on 9/3/25.
//

import SwiftUI


struct RoundedBlackButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .frame(maxWidth: 300, alignment: .center)
            .padding()
            .foregroundStyle(Color(hex:"FFFFFF"))
            .background(Color(hex:"09122C"))
            .clipShape(.buttonBorder, style: .init())
    }
}

struct RoundedSignInButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color(hex:"FFFFFF"))
            .padding(.horizontal, 16)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .clipShape(.capsule, style: .init())
            .padding(.horizontal, .pi)
    }
}

struct ContinueLoginWithEmailButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color(hex:"000000"))
            .fontWeight(.semibold)
            .padding(.horizontal, 16)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(hex:"FFE6C9"))
            .clipShape(.capsule, style: .init())
    }
}

struct ContinueLoginWithEmailButtonDisable: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color(hex:"000000"))
            .fontWeight(.semibold)
            .padding(.horizontal, 16)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(hex:"FFE6C9"))
            .clipShape(.capsule, style: .init())
    }
}

struct ContinueToLoginTinyButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .frame(maxWidth: 70, alignment: .center)
            .padding()
            .foregroundStyle(Color(hex:"FFFFFF"))
            .background(Color(hex:"09122C"))
            .clipShape(.capsule, style: .init())
    }
}

extension View {
    func roundedBlackButton() -> some View {
        modifier(RoundedBlackButton())
    }
    func roundedSignInButton() -> some View {
        modifier(RoundedSignInButton())
    }
    func continueLoginWithEmailButton() -> some View {
        modifier(ContinueLoginWithEmailButton())
    }
    func continueToLoginTinyButton() -> some View {
        modifier(ContinueToLoginTinyButton())
    }
}

#Preview {
    VStack {
        Text("Button")
            .roundedBlackButton()
        
        Text("Button")
            .roundedSignInButton()
        
        Text("Button")
            .continueLoginWithEmailButton()
        
        Text("Button")
            .continueToLoginTinyButton()
    }
}
