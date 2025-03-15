//
//  OnboardingViewModel.swift
//  banking
//
//  Created by Andelson on 10/3/25.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var currentPage: Int8 = 0
    
    init() {
        // TODO
    }
    
    func goToNextPage() {
        self.currentPage = 1
    }
    
    func goToPreviousPage() {
        self.currentPage = 0
    }
}
