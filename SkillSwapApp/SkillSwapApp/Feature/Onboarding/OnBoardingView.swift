//
//  OnBoardingView.swift
//  SkillSwapApp
//
//  Created by Sreekutty Maya on 19/06/2025.
//

import SwiftUI

struct OnBoardingView: View {
    @Environment(AppState.self) var appState
    @State var selectedTab: Int = 1

    var body: some View {
            TabView(selection: $selectedTab) {
                contentView(title: "Welcome To SkillSwap", content: "Connect, Collaborate and Grow Together")
                    .tag (1)
                contentView(title: "Showcase Your Skills", content: "Highlight your expertise and let others know what you offer.")
                    .tag (2)
                contentView(title: "Skill Trade", content: "Send swap requests or message to start exchanging skills effortlessly.")
                    .tag (3)
                contentView(title: "Skill Trade", content: "Send swap requests or message to start exchanging skills effortlessly.")
                    .tag (4)
            }
            .tabViewStyle(.page)
            .edgesIgnoringSafeArea(.all)
            .overlay(alignment:.bottomTrailing) {
                SkipButton
            }
    }

    private var SkipButton : some View {
            Button {
                navigateToHomeScreen()
            } label: {
                ZStack {
                    if(selectedTab == 4) {
                        Text("FINISH")
                    } else {
                        Text("SKIP")
                    }
                }
                .bold()
                .padding()
            }
    }
    
    private func contentView(title: String, content: String) -> some View {
        VStack {
            Spacer()
            Text(title)
                .font(.title)
                .bold()
                .padding(.bottom, 8)
            Text(content)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
        }
        .ignoresSafeArea()
       
    }
    
    private func navigateToHomeScreen() {
        appState.updateShowHomeScreen(showHome: true)
    }
}


#Preview {
    OnBoardingView()
}
