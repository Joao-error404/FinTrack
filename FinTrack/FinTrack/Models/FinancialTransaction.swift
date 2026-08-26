//
//  FinancialTransaction.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 25/08/26.
//

import Foundation
import SwiftData

@Model
final class FinancialTransaction {
    
    var id: UUID
    var title: String
    var amount: Double
    var date: Date
    
    private var typeRawValue: String
    private var categoryRawValue: String
    
    var type: TransactionType{
        get {
            TransactionType(rawValue: typeRawValue) ?? .expense
        }
        set{
            typeRawValue = newValue.rawValue
        }
    }
    
    var category: TransactionCategory{
        get {
            TransactionCategory(rawValue: categoryRawValue) ?? .other
        }
        set{
            categoryRawValue = newValue.rawValue
        }
    }
    
    init(
    id: UUID = UUID(),
    title: String,
    amount: Double,
    date: Date = Date(),
    type: TransactionType,
    category: TransactionCategory
    ) {
    self.id = id
    self.title = title
    self.amount = amount
    self.date = date
    self.typeRawValue = type.rawValue
    self.categoryRawValue = category.rawValue
    }
}
