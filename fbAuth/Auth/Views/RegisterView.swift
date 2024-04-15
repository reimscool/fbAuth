//
//  RegisterView.swift
//  fbAuth
//
//  Created by Christophe BARBOTIN on 13/04/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("S'enregister maintenant")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Button(role: .cancel) {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(Color(uiColor: .label))
                }
            }
            
            FbTextField(placeHolder: "Adresse électronique", text: $viewModel.email)
            
            FbSecureTextField(placeHolder: "Mot de passe", showPassword: $viewModel.showPassword, text: $viewModel.password)

            FbSecureTextField(placeHolder: "Confirmation du mot de passe", showPassword: $viewModel.showPasswordChek, text: $viewModel.passwordCheck)

            Button {
                viewModel.registerWithEmail()
            } label: {
                Text("S'enregistrer")
                    .bold()
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white)
                    )
                    
            }
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color("AppColor"))
    }
    
}

#Preview {
    RegisterView()
}
