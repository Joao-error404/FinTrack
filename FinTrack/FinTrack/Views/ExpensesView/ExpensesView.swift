//
//  ExpensesView.swift
//  FinTrack
//
//  Created by breno.farias on 24/08/26.
//

import SwiftUI
import SwiftData

struct ExpensesView: View {
    
    @State private var showingTab = false
    @State private var selectedTab = 0
    
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
    var body: some View {
        NavigationStack {
            ZStack (alignment: .topTrailing){
                Color("Background")
                    .ignoresSafeArea()
                ScrollView {
                    TransactionsHeader(transactionCount: transactions.count)
                    
                    VStack {
                        HStack{
                            TransactionsSummaryCard(
                                title: "Incomes",
                                amount: totalIncome,
                                icon: "arrow.up.right",
                                color: Color("Success"))
                            
                            TransactionsSummaryCard(
                                title: "Expenses",
                                amount: totalExpense,
                                icon: "arrow.down.right",
                                color: Color("Error"))
                        }
                        
                        TransactionsFilterTab(selectedTab: $selectedTab)
                        
                        TransactionsList(transactions: transactions, selectedTab: $selectedTab)
                    }
                    .padding(.horizontal)
                    
                }
                
                CircleAddButton(showingTab: $showingTab)
            }
        }
        .sheet(isPresented: $showingTab) {
            AddTransactionView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.height(700)])
        }
    }
}

#Preview {
    ExpensesView()
}
