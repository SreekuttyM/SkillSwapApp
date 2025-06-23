//
//  UserAuthenticationView.swift
//  SkillSwapApp
//
//  Created by Sreekutty Maya on 22/06/2025.
//

import SwiftUI
enum UserAuthRoute {
    case login
    case signUp
}
struct UserAuthenticationView: View {
    @Environment(AppState.self) var appState
    @State var navigationPath : [UserAuthRoute] = []
    
    var body: some View {
        NavigationStack(path : $navigationPath) {
            LoginView( navigationPath: $navigationPath)
                .navigationDestination(for: UserAuthRoute.self) { route in
                    switch(route) {
                        case .signUp:
                            SignUpView( navigationPath: $navigationPath)
                        case .login:
                            LoginView(navigationPath: $navigationPath)

                    }
                }
        }
    }
    
}

#Preview {
    UserAuthenticationView()
        .environment(AppState())
    
}
