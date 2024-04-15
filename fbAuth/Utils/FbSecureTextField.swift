//
//  FbSecureTextField.swift
//  fbAuth
//
//  Created by Christophe BARBOTIN on 13/04/2024.
//

import SwiftUI

struct FbSecureTextField: View {
        
    var placeHolder: String
    @Binding var showPassword: Bool
    @Binding var text: String
    
    var body: some View {
        if showPassword {
            FbTextField(placeHolder: placeHolder, text: $text)
                .overlay(alignment: .trailing) {
                    Button(role: .cancel) {
                        withAnimation(.snappy) {
                            showPassword = false
                        }
                    } label: {
                        Image(systemName: "eye")
                            .padding()
                            .contentTransition(.symbolEffect)
                            .foregroundColor(Color("AppColor"))
                    }
                }
        } else {
            SecureField(placeHolder, text: $text)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding()
                .foregroundStyle(.primary)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.ultraThinMaterial)
                        .stroke(Color("AppColor"), style: StrokeStyle(lineWidth: 1) )
                }
                .overlay(alignment: .trailing) {
                    Button(role: .cancel) {
                        withAnimation(.snappy) {
                            showPassword = true
                        }
                    } label: {
                        Image(systemName: "eye.slash")
                            .padding()
                            .contentTransition(.symbolEffect)
                            .foregroundColor(Color("AppColor"))
                    }
                }
        }
    }
}

#Preview {
    FbSecureTextField(placeHolder: "Mot de passe", showPassword: .constant(true), text: .constant(""))
}
