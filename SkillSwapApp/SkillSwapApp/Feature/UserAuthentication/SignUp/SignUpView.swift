//
//  SignUUpView.swift
//  SkillSwapApp
//
//  Created by Sreekutty Maya on 23/06/2025.
//

import SwiftUI

struct SignUpView: View {
    @Environment(AppState.self) var appState
    @StateObject var viewModel : SignUpViewModel = SignUpViewModel()
    @Binding var navigationPath : [UserAuthRoute]

    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .textfieldBackgroundRectangle()
            SecureField("Password", text: $viewModel.password)
                .textfieldBackgroundRectangle()
            TextField("Full name", text: $viewModel.fullName)
                .textfieldBackgroundRectangle()
            GenderView
           
            Spacer()
            
            Button("SIGN UP") {
                btnPressed_signUp()
            }
            .actionButtonRectangleBackground()
            .disabled(!viewModel.isFormValid)
        }
        .padding(.all,20)
        .navigationTitle("SIGN UP")
    }
    
    private var GenderView : some View {
        HStack {
            Text("Gender")
                .font(.title3)
            Spacer()
            Picker("Please select a gender", selection: $viewModel.gender) {
                ForEach(Gender.allCases, id: \.self) {gender in
                    Text(gender.rawValue)
                }
            }
        }
    }
    
    private func btnPressed_signUp() {
        navigationPath = []
        appState.updateIsUserAuthorized(isUserLoggedIn: true)

    }
}

#Preview {
    SignUpView(navigationPath: .constant([.login]))
        .environment(AppState())
}


