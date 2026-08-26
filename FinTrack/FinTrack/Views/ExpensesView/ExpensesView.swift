//
//  ExpensesView.swift
//  FinTrack
//
//  Created by breno.farias on 24/08/26.
//

import SwiftUI

struct ExpensesView: View {
    @State private var totalIncomes = 0.0
    @State private var totalExpenses = 0.0
    @State private var selectedTab = 0
    
    let transactions = [
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
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                ScrollView {
                    
                    TransactionsHeader(transactionCount: transactions.count)
                    
                    VStack {
                        HStack{
                            TransactionsSummaryCard(
                                title: "Incomes",
                                amount: totalIncomes,
                                icon: "arrow.up.right",
                                color: Color("Success"))
                            
                            TransactionsSummaryCard(
                                title: "Expenses",
                                amount: totalExpenses,
                                icon: "arrow.down.right",
                                color: Color("Error"))
                        }
                        
                        TransactionsFilterTab(selectedTab: $selectedTab)
                        
                        TransactionsList(transactions: transactions)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ExpensesView()
}
