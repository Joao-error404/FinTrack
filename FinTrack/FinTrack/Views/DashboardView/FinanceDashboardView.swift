//
//  FinanceDashboardView.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 24/08/26.
//

import SwiftUI
import SwiftData

struct FinanceDashboardView: View {

    @Query(sort: \FinancialTransaction.date, order: .reverse)
    
    private var transactions: [FinancialTransaction]
    
    private var totalIncome: Double {
        transactions.filter{ $0.type == .income}
            .reduce(0){ result, transaction
                in
                    result + transaction.amount
            }
    }
    
    private var totalExpense: Double {
        transactions.filter{ $0.type == .expense}
            .reduce(0){ result, transaction
                in
                    result + transaction.amount
            }
    }
    
    private var balance: Double {
        totalIncome - totalExpense
    }
    
    private var recentTransactions: [FinancialTransaction] {
        Array(transactions.prefix(5))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 24) {
                        
                        HeaderView()
                        
                        BalanceCardView(balance: balance,
                                        income: totalIncome,
                                        expense: totalExpense)
                        
                        SummaryCardsView(balance: balance,
                                         income: totalIncome,
                                         expense: totalExpense)
                        
                        RecentTransactionsView(transactions: recentTransactions)
                        
                        Spacer()
                    }
                    .padding(20)
                    
                    
                }
            }
        }
    }
}

#Preview {
    FinanceDashboardView()
}
