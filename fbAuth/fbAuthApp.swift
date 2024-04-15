//
//  fbAuthApp.swift
//  fbAuth
//
//  Created by Christophe BARBOTIN on 13/04/2024.
//

import SwiftUI
import FirebaseCore

@main
struct fbAuthApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            if AuthService.shared.currentUser != nil {
                HomeView()
            } else {
                SignInView()
            }
        }
    }
}
