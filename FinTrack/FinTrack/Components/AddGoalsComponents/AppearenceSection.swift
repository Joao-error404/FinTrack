//
//  AppearenceSection.swift
//  FinTrack
//
//  Created by breno.farias on 28/08/26.
//

import SwiftUI

struct AppearenceSection: View {
    @Binding var icon: String
    @Binding var colorName: String
    
    private let icons = [
        "target",
        "house.fill",
        "car.fill",
        "airplane",
        "graduationcap.fill",
        "heart.fill",
        "star.fill",
        "gift.fill",
        "briefcase.fill"
    ]
    
    var body: some View {
        VStack {
            Text("Appearence")
                .sectionTitleModifier()
            
            HStack {
                Text("Select an icon")
                    .foregroundStyle(Color("Foreground"))
                
                Spacer()
                
                Picker("Icon", selection: $icon) {
                    ForEach(icons, id: \.self) { iconName in
                        Label(iconName, systemImage: iconName)
                            .tag(iconName)
                    }
                }
                .tint(Color("Accent"))
            }
            
            HStack {
                Text("Color")
                    .foregroundStyle(Color("Foreground"))
                Spacer()
                
                ForEach(GoalColor.allCases) { goalColor in
                    Button {
                        colorName = goalColor.rawValue
                    } label: {
                        Circle()
                            .fill(goalColor.color)
                            .frame(width: 28, height: 28)
                            .overlay {
                                if colorName == goalColor.rawValue {
                                    Image(systemName: "checkmark")
                                        .font(.caption.bold())
                                        .foregroundStyle(.white)
                                }
                            }
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel(goalColor.rawValue)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frameStyle()
    }
}

#Preview {
    AppearenceSection(icon: .constant("airplane"), colorName: .constant(GoalColor.accent.rawValue))
}
