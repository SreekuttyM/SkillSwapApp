//
//  View+EXT.swift
//  SkillSwapApp
//
//  Created by Sreekutty Maya on 23/06/2025.
//

import SwiftUI

extension View {
    
    func textfieldBackgroundRectangle() -> some View {
        self
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height:60)
        .background(
            RoundedRectangle(cornerRadius: 12)
            .fill(.disabled)
        )
    }
    
    func actionButtonRectangleBackground() -> some View {
        self
            .font(.title3)
        .frame(maxWidth: .infinity,maxHeight: 50)
        .foregroundStyle(.white)
        .background(.accent)
        .cornerRadius(12)
        
    }
}
