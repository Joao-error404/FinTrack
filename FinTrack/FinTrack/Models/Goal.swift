//
//  Goal.swift
//  FinTrack
//
//  Created by breno.farias on 27/08/26.
//

import Foundation
import SwiftData
import SwiftUI

enum GoalColor: String, CaseIterable, Identifiable {
    case accent, blue, green, orange, pink
    
    var id: String { rawValue }
    
    var color: Color {
        switch self {
        case .accent: Color("Accent")
        case .blue: .blue
        case .green: .green
        case .orange: .orange
        case .pink: .pink
        }
    }
    
    var darkerColor: Color {
        switch self {
        case .accent, .pink: .purple
        case .blue: .cyan
        case .green: .mint
        case .orange: .red
        }
    }
}

@Model
final class Goal {
    var id: UUID
    var title: String
    var deadline: Date?
    var targetAmount: Double
    var currentAmount: Double
    var createdAt: Date
    var icon: String
    var colorName: String
    
    var progress: Double {
        guard targetAmount > 0 else { return 0 }
        return min(currentAmount / targetAmount, 1)
    }
    
    var remainingAmount: Double {
        max(targetAmount - currentAmount, 0)
    }
    
    var isCompleted: Bool {
        currentAmount >= targetAmount
    }
    
    init(id: UUID, title: String, deadline: Date? = nil, targetAmount: Double, currentAmount: Double, createdAt: Date, icon: String, colorName: String = GoalColor.accent.rawValue) {
        self.id = id
        self.title = title
        self.deadline = deadline
        self.targetAmount = targetAmount
        self.currentAmount = currentAmount
        self.createdAt = createdAt
        self.icon = icon
        self.colorName = colorName
    }
    
    var goalColor: GoalColor {
        GoalColor(rawValue: colorName) ?? .accent
    }
}
