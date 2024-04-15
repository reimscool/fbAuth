//
//  SignInViewModel.swift
//  fbAuth
//
//  Created by Christophe BARBOTIN on 13/04/2024.
//

import Foundation
import Observation

enum AppAuthError: Error {
        case invalidEmail
        case invalidPasswordLength
        case passwordDoNotMatch
}

@Observable
class SignInViewModel {
    var email = ""
    var password = ""
    var resetPasswordEmail = ""
    var showPassword = false
    var showRegistration = false
    var showResetPassword = false
    
    func validateSignInForm() throws {
        if !email.isValidEmail() {
            throw AppAuthError.invalidEmail
        } else if password.count < 5 {
            throw AppAuthError.invalidPasswordLength
        }
    }
    
    func validateForgotPasswodForm() throws {
        if !resetPasswordEmail.isValidEmail() {
            throw AppAuthError.invalidEmail
        }
    }
    
    func signInWithEmail() {
        Task {
            do {
                try validateSignInForm()
                try await AuthService.shared.signInWithEmail(email: email, password: password)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func resetPassword() {
        Task {
            do {
                try validateForgotPasswodForm()
                try await AuthService.shared.resetPassword(email: resetPasswordEmail)
                showResetPassword = false
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
