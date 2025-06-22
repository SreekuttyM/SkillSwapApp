//
//  AppBuilderView.swift
//  SkillSwapApp
//
//  Created by Sreekutty Maya on 19/06/2025.
//

import SwiftUI

struct AppBuilderView<OnboardingView : View,HomeView : View,UserAuthenticationScreen :View>: View {
    var showHome : Bool
    @State var isUserLoggedIn : Bool

    @ViewBuilder var onboardingView : OnboardingView
    @ViewBuilder var homeView : HomeView
    @ViewBuilder var userAuthenticationView : UserAuthenticationScreen

    var body: some View {
        ZStack {
            if showHome {
                if !isUserLoggedIn {
                    UserAuthenticationView()
                } else {
                    homeView
                        .transition(.move(edge: .trailing))
                }
            } else {
                onboardingView
                .transition(.move(edge: .leading))
            }
        }
        .animation(.smooth, value: showHome)
        .ignoresSafeArea()
        
    }
}

private struct PreviewView: View {
    @State var showHome: Bool = false
    
    var body: some View {
        AppBuilderView(showHome: true,
                       isUserLoggedIn:true,
                       onboardingView: {
            ZStack {
                Color.red
                Text("Tab bar")
            }
        }, homeView: {
            ZStack {
                Color.blue
                Text("Onboarding")
                
            }
        }, userAuthenticationView: {
            ZStack {
                Color.yellow
                Text("User Auth")
                
            }
        })
        
    }
}


#Preview {
    PreviewView()
}
