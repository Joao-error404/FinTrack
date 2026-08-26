//
//  TransactionType.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 25/08/26.
//
import Foundation

enum TransactionType: String, Codable, CaseIterable, Identifiable {
    case income
    case expense
    
    var id: String {
        rawValue
    }
    
    var title: String {
        switch self {
        case .income:
            return "Entrada"
        case .expense:
            return "Despesa"
        }
    }
    
}
