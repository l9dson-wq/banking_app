//
//  AppTextConstants.swift
//  banking
//
//  Created by Andelson on 15/3/25.
//

import Foundation

/// This class contains all text constants used in the app UI
struct AppTextConstants {
    
    // MARK: - Onboarding Screens
    struct Onboarding {
        // First Screen
        static let titleFreedom = "Freedom"
        static let subtitleSaving = "Saving is now easier, more pratical, and safer"
        static let descriptionBanking = "Your Money, Simplified. Banking That Works For You. No paperwork. No waiting. Just simple, powerful banking at your fingertips."
        static let nextButton = "Next"
        static let madeBy = "Made by "
        static let developerName = "Andelson Lopez"
        
        // Second Screen
        static let titleGetStarted = "Get Started"
        static let descriptionWorkshops = "Register for Financial Workshops and Visualize Your Financial Journey Connect with financial education opportunities."
        static let googleSignUp = "Sign up with google"
        static let emailSignUp = "Sign up with email"
        static let alreadyHaveAccount = "Already have an account?"
        static let logIn = "Log in"
    }
    
    // MARK: - Authentication Screens
    struct Auth {
        static let welcomeBack = "Welcome Back"
        static let emailPlaceholder = "Email"
        static let passwordPlaceholder = "Password"
        static let forgotPassword = "Forgot Password?"
        static let loginButton = "Log In"
        static let noAccountYet = "Don't have an account yet?"
        static let signUp = "Sign Up"
    }
    
    // MARK: - Dashboard
    struct Dashboard {
        static let welcomeMessage = "Hello, "
        static let accountBalance = "Current Balance"
        static let recentTransactions = "Recent Transactions"
        static let viewAll = "View All"
        static let savings = "Savings"
        static let expenses = "Expenses"
    }
    
    // MARK: - Error Messages
    struct Errors {
        static let genericError = "Something went wrong. Please try again."
        static let networkError = "Please check your internet connection and try again."
        static let authError = "Invalid email or password. Please try again."
    }
}
