//
//  LoginView.swift
//  SkillSwapApp
//
//  Created by Sreekutty Maya on 22/06/2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel : LoginViewModel = LoginViewModel()
    @Binding var navigationPath : [UserAuthRoute]
    @Environment(AppState.self) var appState

    var body: some View {
        VStack(spacing:10) {
            TextField("Email", text: $viewModel.email)
                .textfieldBackgroundRectangle()
            SecureField("Password", text: $viewModel.password)
                .textfieldBackgroundRectangle()
            Spacer()
            Button("LOGIN") {
                btnPressed_login()
            }
            .actionButtonRectangleBackground()
            .disabled(!viewModel.isFormValid)
            HStack {
                Text("Don’t have an account?")
                Button("Register") {
                    navigationPath.append(.signUp)
                }
            }
        }
        .padding()
        .navigationTitle("LOGIN")

    }
    
    func btnPressed_login() {
        appState.updateIsUserAuthorized(isUserLoggedIn: true)
    }
}

#Preview {
    LoginView(navigationPath: .constant([.login]))
        .environment(AppState())
}
