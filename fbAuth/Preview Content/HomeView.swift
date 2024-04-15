//
//  HomeView.swift
//  fbAuth
//
//  Created by Christophe BARBOTIN on 13/04/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("coucou")
            
            Button(role: .destructive) {
                do {
                    try AuthService.shared.signOut()
                } catch {
                    print(error.localizedDescription)
                }
            } label: {
                Text("Sign Out")
            }
        }
    }
}

#Preview {
    HomeView()
}
