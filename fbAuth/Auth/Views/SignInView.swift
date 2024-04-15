//
//  SignInView.swift
//  fbAuth
//
//  Created by Christophe BARBOTIN on 13/04/2024.
//

import SwiftUI

struct SignInView: View {
    
    @State var viewModel = SignInViewModel()
    
    var body: some View {
        VStack {
            Image("firebaseImg")
                .resizable()
                .scaledToFill()
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [.black.opacity(0.4), .clear]), startPoint: .bottom, endPoint: .top)
                )
                .frame(height: 350)
            
            Spacer()
            
            VStack {
                FbTextField(placeHolder: "Votre adresse électronique", text: $viewModel.email)
                
                FbSecureTextField(placeHolder: "Mot de passe", showPassword: $viewModel.showPassword, text: $viewModel.password)
                
                Button("Mot de passe oublié ?") {
                    viewModel.showResetPassword = true
                }
                .bold()
                .padding(.vertical)
                .foregroundStyle(Color("AppColor"))

                Button {
                    viewModel.signInWithEmail()
                } label: {
                    Text("Se connecter")
                        .bold()
                        .foregroundStyle(.white)
                        .frame(height: 45)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color("AppColor"))
                        )
                }
                
            }
            .padding(.horizontal)
            
            Spacer()
            
            VStack(spacing: 24) {
                Text("Pas encore de compte ?")
                    .foregroundStyle(Color("AppColor"))

                Button {
                    viewModel.showRegistration = true
                } label: {
                    Text("Créer un compte")
                        .bold()
                        .foregroundStyle(Color("AppColor"))
                        .frame(height: 45)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color("AppColor"))
                        )
                }
                .padding()
                .padding(.bottom)
            }
            
        }
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
        .ignoresSafeArea()
        .sheet(isPresented: $viewModel.showRegistration) {
            RegisterView()
                .presentationDetents([.fraction(0.5)])
        }
        .sheet(isPresented: $viewModel.showResetPassword) {
            ForgotPassword(viewModel: viewModel)
                .presentationDetents([.fraction(0.3)])
        }
    }
}

#Preview {
    SignInView()
}
