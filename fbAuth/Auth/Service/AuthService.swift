//
//  AuthService.swift
//  fbAuth
//
//  Created by Christophe BARBOTIN on 13/04/2024.
//

import Foundation
import FirebaseAuth

@Observable
final class AuthService {

    var currentUser: FirebaseAuth.User?
    private let auth = Auth.auth()
    static let shared = AuthService()
    
    private init() {
        currentUser = auth.currentUser
    }
    
    func registerWithEmail(email: String, password: String) async throws {
        do {
            let result = try await auth.createUser(withEmail: email, password: password)
            currentUser = result.user
        } catch {

            }
        }
    }
    
    func signInWithEmail(email: String, password: String) async throws {
        do {
            let result = try await auth.signIn(withEmail: email, password: password)
            print("ok")
            currentUser = result.user
        } catch {
            
        }
    }
    
    func resetPassword(email: String) async throws {
        try await auth.sendPasswordReset(withEmail: email)
    }
    
    func signOut() throws {
        try auth.signOut()
        currentUser = nil
    }
    
}
