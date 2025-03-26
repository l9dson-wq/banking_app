//
//  CardModel.swift
//  
//
//  Created by Andelson on 16/3/25.
//

import Foundation

struct CardModel: Identifiable {
    let id = UUID()
    let type: String
    let balance: Double
    let lastDigits: String
    let color: String
}
