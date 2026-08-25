//
//  TransactionCategory.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 25/08/26.
//

import Foundation

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
            return "Alimentação"
        case .transport:
            return "Transporte"
        case .education:
            return "Educação"
        case .investment:
            return "Investimentos"
        case .salary:
            return "Salário"
        case .entertainment:
            return "Entretenimento"
        case .health:
            return "Saúde"
        case .other:
            return "Outros"
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
    
}
