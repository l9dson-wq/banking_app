//
//  LoginView.swift
//  banking
//
//  Created by Andelson on 9/3/25.
//

import SwiftUI

struct LoginView: View {
    @State var previewEmail = ""
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: OnboardingViewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            Color(hex:"09122C").ignoresSafeArea()
            
            VStack {
               
                VStack {
                    Text("Continue with email")
                        .font(.system(size: 25))
                        .fontWeight(.heavy)
                        .foregroundStyle(Color(hex:"FFF"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("sign in or sign up with your email.")
                        .font(.body)
                        .foregroundStyle(Color(hex:"FFF"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                VStack {
                    Text("Email")
                        .foregroundStyle(Color(hex:"FFF"))
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField(
                        "",
                        text: $viewModel.userEmail,
                        prompt: Text("Type your email here").foregroundStyle(Color(hex:"cccccc"))
                    )
                    .font(.system(size: 16))
                    .foregroundStyle(Color(hex:"FFF"))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                    .disableAutocorrection(true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                
                Spacer()
                
                NavigationLink(destination: LoginByEmailSecurityCode().environmentObject(viewModel)) {
                    Text("Continue")
                        .foregroundStyle(Color(hex: "000"))
                        .font(.headline)
                }
                .continueLoginWithEmailButton()
            }
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onChange(of: viewModel.userEmail) { newValue in
            print("Email changed to: \(newValue)")
        }
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

#Preview {
    LoginView()
}
