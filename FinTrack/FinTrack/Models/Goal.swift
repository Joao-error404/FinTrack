//
//  Goal.swift
//  FinTrack
//
//  Created by breno.farias on 27/08/26.
//

import Foundation
import SwiftData

@Model
final class Goal {
    var id: UUID
    var title: String
    var deadline: Date?
    var targetAmount: Double
    var currentAmount: Double
    var createdAt: Date
    var icon: String
    
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
    
    init(id: UUID, title: String, deadline: Date? = nil, targetAmount: Double, currentAmount: Double, createdAt: Date, icon: String) {
        self.id = id
        self.title = title
        self.deadline = deadline
        self.targetAmount = targetAmount
        self.currentAmount = currentAmount
        self.createdAt = createdAt
        self.icon = icon
    }
}
