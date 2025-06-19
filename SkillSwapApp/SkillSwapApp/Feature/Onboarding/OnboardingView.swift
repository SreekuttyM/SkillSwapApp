//
//  OnboardingView.swift
//  SkillSwapApp
//
//  Created by Sreekutty Maya on 19/06/2025.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selectedTab = 0
    var body: some View {
        ZStack{
            Color.background
            TabView(selection: $selectedTab) {
                    contentView(title: "Welcome To SkillSwap", content: "Connect, Collaborate and Grow Together").tag(1)
                    contentView(title: "Showcase Your Skills", content: "Highlight your expertise and let others know what you offer.").tag(2)
                    contentView(title: "Skill Trade", content: "Send swap requests or message to start exchanging skills effortlessly.").tag(3)
                    contentView(title: "Get Started Today", content: "Sign up now and join a thriving community of learners and experts").tag(4)
                }.tabViewStyle(.page)
              SkipButton
        }
        .ignoresSafeArea()
    }
    
    private var SkipButton : some View {
        VStack {
            Spacer()
            HStack{
                Spacer()
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
                }
                .padding()
            }
        }.padding()
            .safeAreaPadding(.bottom)
    }
    
    private func contentView(title: String, content : String) -> some View {
        VStack(spacing: 10) {
            Text(title)
                .bold()
                .font(.title)
                .foregroundStyle(.text)
            Text(content)
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.text)
        }
        .multilineTextAlignment(.center)

    }
    
    private func navigateToHomeScreen() {
        
    }
    
}

#Preview {
    OnboardingView()
}
