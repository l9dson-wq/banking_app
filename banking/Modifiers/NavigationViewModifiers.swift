//
//  NavigationViewModifiers.swift
//  banking
//
//  Created by Andelson on 16/3/25.
//

import SwiftUI

struct NavigationViewWithCustomArrow: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrowshape.left.fill", variableValue: 1.00)
                        .symbolRenderingMode(.monochrome)
                        .foregroundColor(Color(hex:"FFF"))
                        .font(.system(size: 16, weight: .regular))
                }
            })
    }
}

extension View {
    func navigationViewWithCustomArrow() -> some View {
        modifier(NavigationViewWithCustomArrow())
    }
}
