//
//  FrameModifiers.swift
//  banking
//
//  Created by Andelson on 9/3/25.
//

import SwiftUI

/// # Frame modifiers.
/// frames allow me modify a component layout in the view
/// like their width, height and alignment.
struct FullWidthBottomLeadingModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .bottomLeading)
    }
}


/// # Extending from View.
/// - Why?
/// -> Because doing it this way it will be more easier for us to access these modifiers.
extension View {
    func fullWidthBottomLeading() -> some View {
        modifier(FullWidthBottomLeadingModifier())
    }
}

#Preview {
    VStack {
        Text("With FullWidthBottomLeadingModifier")
            .padding()
            .border(.red, width: .pi)
            .fullWidthBottomLeading()
        
        Text("Without it is centered")
            .padding()
            .border(.red, width: .pi)
        
        Spacer()
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    .border(.cyan, width: .pi)
}
