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
    @Published var totalIncomes = 0.0
    @Published var totalExpenses = 0.0
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
