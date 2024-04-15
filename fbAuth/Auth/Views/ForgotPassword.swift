//
//  ForgotPassword.swift
//  fbAuth
//
//  Created by Christophe BARBOTIN on 15/04/2024.
//

import SwiftUI

struct ForgotPassword: View {
    @Bindable var viewModel: SignInViewModel

    var body: some View {
        VStack {
            Text("Réinitialiser votre mot de passe")
                .font(.title)
                .bold()
            
            FbTextField(placeHolder: "Entrez votre email", text: $viewModel.resetPasswordEmail)
            
            Button {
                viewModel.resetPassword()
            } label: {
                Text("Réinitialiser le mot de passe")
                    .bold()
                    .padding()
                    .foregroundStyle(Color("AppColor"))
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("AppColor"))
                    )
            }
        }
        .padding()
    }
}

#Preview {
    ForgotPassword(viewModel: SignInViewModel())
}
