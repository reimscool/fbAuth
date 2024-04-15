//
//  FbTextField.swift
//  fbAuth
//
//  Created by Christophe BARBOTIN on 13/04/2024.
//

import SwiftUI

struct FbTextField: View {
    
    var placeHolder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeHolder, text: $text)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .padding()
            .foregroundStyle(.primary)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial)
                    .stroke(Color("AppColor"), style: StrokeStyle(lineWidth: 1) )
            }
    }
}

#Preview {
    FbTextField(placeHolder: "Email", text: .constant(""))
}
