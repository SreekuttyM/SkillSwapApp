//
//  AppBuilderView.swift
//  SkillSwapApp
//
//  Created by Sreekutty Maya on 19/06/2025.
//

import SwiftUI

struct AppBuilderView<OnboardingView : View,HomeView : View>: View {
    var showHome : Bool
    @ViewBuilder var onboardingView : OnboardingView
    @ViewBuilder var homeView : HomeView

    var body: some View {
        ZStack {
            if showHome {
                homeView
                    .transition(.move(edge: .trailing))
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
        AppBuilderView(
            showHome: true,
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
        })
        
    }
}


#Preview {
    PreviewView()
}
