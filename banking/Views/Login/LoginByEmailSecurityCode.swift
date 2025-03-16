//
//  LoginByEmailSecurityCode.swift
//  banking
//
//  Created by Andelson on 16/3/25.
//

import SwiftUI

struct LoginByEmailSecurityCode: View {
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack {
                Text("Enter Code")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(hex:"FFF"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Text("We sent a verification code to your email ") + Text("\(onboardingViewModel.userEmail)").fontWeight(.bold)
                }
                .foregroundStyle(Color(hex:"FFF"))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField(
                "",
                text: $onboardingViewModel.emailCode,
                prompt: Text("Type the code here").foregroundStyle(Color(hex:"cccccc"))
            )
            .font(.system(size: 16))
            .foregroundStyle(Color(hex:"FFF"))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
            )
            .disableAutocorrection(true)
            .padding([.top], 40)
            
            Spacer()
            
            Button(action: {
                
            }) {
                Text("Verify code")
                    .continueLoginWithEmailButton()
            }
            .padding(.bottom, 40)
            .padding([.leading, .trailing], 20)
        }
        .padding()
        .background(Color(hex:"09122C"))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationViewWithCustomArrow()
    }
}

#Preview {
    LoginByEmailSecurityCode()
        .environmentObject(OnboardingViewModel())
}
