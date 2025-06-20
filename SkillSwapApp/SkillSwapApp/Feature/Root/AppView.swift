//
//  AppView.swift
//  SkillSwapApp
//
//  Created by Sreekutty Maya on 19/06/2025.
//

import SwiftUI

struct AppView: View {
    @State var appState : AppState = AppState()
    
    var body: some View {
        AppBuilderView(
            showHome: appState.showHome, onboardingView: {
                OnboardingView()
            }, homeView: {
                HomeView()
            })
        .environment(appState)
    }
}

#Preview("AppView - HomeScreen") {
    AppView(appState: AppState(showHome: true))
}


#Preview("AppView - OnBoarding") {
    AppView(appState: AppState(showHome: false))
        
}
