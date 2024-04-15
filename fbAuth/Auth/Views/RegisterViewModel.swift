//
//  RegisterViewModel.swift
//  fbAuth
//
//  Created by Christophe BARBOTIN on 13/04/2024.
//

import Foundation

@Observable
class RegisterViewModel {
    var email = ""
    var password = ""
    var showPassword = false
    var passwordCheck = ""
    var showPasswordChek = false
    
    func validateForm() throws {
        if !email.isValidEmail() {
            throw AppAuthError.invalidEmail
        } else if password.count < 5 {
            throw AppAuthError.invalidPasswordLength
        } else if password != passwordCheck {
            throw AppAuthError.passwordDoNotMatch
        }
    }
    
    func registerWithEmail() {
        Task {
            do {
                try validateForm()
                try await AuthService.shared.registerWithEmail(email: email, password: password)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
