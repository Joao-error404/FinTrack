//
//  ExpensesViewModel.swift
//  FinTrack
//
//  Created by breno.farias on 26/08/26.
//

import Combine
import Foundation

@MainActor
class ExpensesViewModel: ObservableObject {
    var totalIncomes: Double {
        transactions
            .filter { $0.type == .income }
            .reduce(0) { $0 + $1.amount }
    }
    var totalExpenses: Double {
        transactions
            .filter { $0.type == .expense }
            .reduce(0) { $0 + $1.amount }
    }
    
    @Published var transactions = [
        FinancialTransaction(
            title: "Teste",
            amount: 20.0,
            type: TransactionType.expense,
            category: TransactionCategory.education),
        FinancialTransaction(
            title: "Teste 2",
            amount: 30.0,
            type: TransactionType.income,
            category: TransactionCategory.education)
    ]
}
