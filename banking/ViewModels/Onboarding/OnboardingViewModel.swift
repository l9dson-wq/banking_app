//
//  OnboardingViewModel.swift
//  banking
//
//  Created by Andelson on 10/3/25.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var currentPage: Int8 = 0
    @Published var userEmail: String = ""
    @Published var emailCode: String = ""
    
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
