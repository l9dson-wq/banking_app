//
//  LoginView.swift
//  banking
//
//  Created by Andelson on 9/3/25.
//

import SwiftUI

struct LoginView: View {
    @State var previewEmail = ""
    
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
//                .padding(10)
                
                VStack {
                    Text("Email")
                        .foregroundStyle(Color(hex:"FFF"))
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField(
                        "",
                        text: $previewEmail,
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
                
                Button(action: {
                    
                }) {
                    Text("Continue")
                        .continueLoginWithEmailButton()
                }
                .padding(.bottom, 40)
                .padding([.leading, .trailing], 20)
            }
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    LoginView()
}
