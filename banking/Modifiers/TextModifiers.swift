//
//  TextModifiers.swift
//  banking
//
//  Created by Andelson on 9/3/25.
//

import SwiftUI

struct TextLargeTitleHeavyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.heavy)
            .foregroundStyle(Color(hex: "09122C"))
    }
}

struct TextTitleBoldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color(hex: "09122C"))
            .font(.headline)
            .fontWeight(.light)
            .multilineTextAlignment(.center)
    }
}

struct TextSubTitleLightCenteredModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 23))
            .fontWeight(.light)
            .multilineTextAlignment(.center)
            .foregroundStyle(Color(hex: "09122C"))
    }
}

extension View {
    func textLargeTitleHeavyModifier() -> some View {
        modifier(TextLargeTitleHeavyModifier())
    }
    
    func textTitleBoldModifier() -> some View {
        modifier(TextTitleBoldModifier())
    }
    
    func textSubTitleLightCenteredModifier() -> some View {
        modifier(TextSubTitleLightCenteredModifier())
    }
}

#Preview {
    VStack {
        Text("LARGE TITLE")
            .textLargeTitleHeavyModifier()
        
        Text("TITLE")
            .textTitleBoldModifier()
        
        Text("SUBTITLE MODIFIER")
            .textSubTitleLightCenteredModifier()
    }
}
