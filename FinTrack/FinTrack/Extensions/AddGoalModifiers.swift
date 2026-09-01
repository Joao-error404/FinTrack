//
//  AddGoalModifiers.swift
//  FinTrack
//
//  Created by breno.farias on 28/08/26.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: 30)
            .background(Color("SurfaceSecondary"))
            .cornerRadius(10)
    }
}

struct SectionTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .foregroundStyle(Color("Foreground"))
            .fontWeight(.bold)
    }
}

struct SectionTextFieldTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundStyle(Color("Foreground"))
            .padding(.horizontal)
    }
}


extension View {
    func textFieldModifier() -> some View {
        modifier(TextFieldModifier())
    }
    
    func sectionTitleModifier() -> some View {
        modifier(SectionTitleModifier())
    }
    
    func sectionTextFieldTitleModifier() -> some View {
        modifier(SectionTextFieldTitleModifier())
    }
}
