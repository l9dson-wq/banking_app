//
//  PostSplashView.swift
//  banking
//
//  Created by Andelson on 9/3/25.
//

import SwiftUI

// MARK: Main page
struct PostSplashView: View {
    @StateObject private var onboardingViewModel = OnboardingViewModel()

    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    VStack(spacing: DeviceResponsiveDesign.vStackSpacing(for: geometry)) {
                        Image("coffe_girl")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: geometry.size.height * 0.6)
                        
                        VStack {
                            let whatDevice = DeviceResponsiveDesign.WhatDeviceAmI(for: geometry)
                            
                            /// Logic to change the view that the user is seeing
                            /// at the moment of onboarding
                            if onboardingViewModel.currentPage == 0 {
                                /// if the device is big enough add a spacer here
                                if whatDevice == .largePhone { Spacer() }
                                
                                PostSplashFirstView()
                                    .transition(.asymmetric(
                                        insertion: .move(edge: .trailing).combined(with: .opacity),
                                        removal: .move(edge: .leading).combined(with: .opacity)
                                    ))
                            } else if onboardingViewModel.currentPage == 1 {
                                PostSplashSecondView()
                                    .transition(.asymmetric(
                                        insertion: .move(edge: .trailing).combined(with: .opacity),
                                        removal: .move(edge: .leading).combined(with: .opacity)
                                    ))
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(
                            RoundedRectangle(cornerRadius: 50)
                                .fill(Color.white)
                        )
                        .environmentObject(onboardingViewModel)

                    }
                }
                .animation(
                    .spring(
                        response: 0.4,
                        dampingFraction: 0.8,
                        blendDuration: 0.2
                    ),
                    value: onboardingViewModel.currentPage
                )
            }
        }
    }
}

// MARK: First page content
struct PostSplashFirstView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel
    @State private var selected: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text(AppTextConstants.Onboarding.subtitleSaving)
                        .font(.system(size: geometry.size.height * 0.08))
                        .fontWeight(.bold)
                        .padding(.top, 10)
                        .padding(.bottom, 1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(AppTextConstants.Onboarding.descriptionBanking)
                        .font(.system(size: geometry.size.height * 0.05))
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    // show next view
                    viewModel.goToNextPage()
                }) {
                    Text("Next")
                        .continueToLoginTinyButton()
                }
                .padding(.bottom, geometry.size.height * 0.07)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                VStack {
                    Text("Made by ") + Text("Andelson Lopez").fontWeight(.bold)
                }
                .frame(alignment: .bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

// MARK: Second page content
struct PostSplashSecondView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                VStack {
                    Text("Get Started")
                        .font(.system(size: geometry.size.height * 0.08))
                        .fontWeight(.bold)
                        .padding(.top, 10)
                        .padding(.bottom, 1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(AppTextConstants.Onboarding.descriptionWorkshops)
                        .font(.system(size: geometry.size.height * 0.05))
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                
                VStack {
                    NavigationLink(destination: LoginView()) {
                        HStack {
                            Image("Glogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 20)
                            Text("Sign up with google")
                                .foregroundStyle(Color(hex: "FFFFFF"))
                                .font(.headline)
                        }
                    }
                    .roundedSignInButton()
                    
                    NavigationLink(destination: LoginView()) {
                        HStack {
                            Image(systemName: "envelope", variableValue: 1.00)
                                .symbolRenderingMode(.monochrome)
                                .foregroundColor(Color.accentColor)
                                .font(.system(size: 16, weight: .regular))
                            Text("Sign up with email")
                                .foregroundStyle(Color(hex: "FFFFFF"))
                                .font(.headline)
                        }
                    }
                    .roundedSignInButton()

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                Spacer()
                
                HStack {
                    Text("Already have an account?")
                    NavigationLink(destination: LoginView()) {
                        Text("Log in")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundStyle(Color(hex:"000000"))
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview {
    PostSplashView()
        .environmentObject(OnboardingViewModel())
}
