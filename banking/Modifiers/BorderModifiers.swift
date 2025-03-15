//
//  BorderModifiers.swift
//  banking
//
//  Created by Andelson on 9/3/25.
//

import SwiftUI

///# Border modifier
/// - I am gonna be using this for View construction only (or probably further things).
struct SimpleBorder: ViewModifier {
    func body(content: Content) -> some View {
        content
            .border(.red, width: 2)
    }
}

extension View {
    func simpleBorder() -> some View {
        modifier(SimpleBorder())
    }
}

#Preview {
    Text("Hello, world!")
        .padding()
        .simpleBorder()
}
