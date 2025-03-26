//
//  AccountOverview.swift
//  banking
//
//  Created by Andelson on 24/3/25.
//

import SwiftUI

struct AccountOverview: View {
    var body: some View {
        ZStack {
            VStack {
                Text("$200,000")
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .simpleBorder()
        }
    }
}

#Preview {
    AccountOverview()
}
