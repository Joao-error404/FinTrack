//
//  TransactionCategory.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 25/08/26.
//

import Foundation
import SwiftUI

enum TransactionCategory: String, Codable, CaseIterable, Identifiable {
    case food
    case transport
    case education
    case investment
    case salary
    case entertainment
    case health
    case other
    
    var id: String{
        rawValue
    }
    
    var title: String{
        switch self {
        case .food:
            return "Food"
        case .transport:
            return "Transport"
        case .education:
            return "Education"
        case .investment:
            return "Investment"
        case .salary:
            return "Salary"
        case .entertainment:
            return "Entertainment"
        case .health:
            return "Health"
        case .other:
            return "Other"
        }
    }
    
    var icon: String{
        switch self {
        case .food:
            return "fork.knife"
        case .transport:
            return "car.fill"
        case .education:
            return "graduationcap.fill"
        case .investment:
            return "chart.line.uptrend.xyaxis"
        case .salary:
            return "dollarsign.circle"
        case .entertainment:
            return "gamecontroller.fill"
        case .health:
            return "heart.fill"
        case .other:
            return "questionmark.circle.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .food:
            return .red
        case .transport:
            return .orange
        case .education:
            return .cyan
        case .investment:
            return .yellow
        case .salary:
            return .green
        case .entertainment:
            return .blue
        case .health:
            return .pink
        case .other:
            return .purple
        }
    }
    
}
