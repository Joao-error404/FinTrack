//
//  ExpensesView.swift
//  FinTrack
//
//  Created by breno.farias on 24/08/26.
//

import SwiftUI

struct ExpensesView: View {
    @State private var totalEarnings = 0.0
    @State private var totalExpenses = 0.0
    @State private var selectedTab = 0
    
    let tabs = [
        "All",
        "Income",
        "Expense"
    ]
    
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
                                amount: 0.0,
                                icon: "arrow.up.right",
                                color: Color("Success"))
                            
                            TransactionsSummaryCard(
                                title: "Expenses",
                                amount: 0.0,
                                icon: "arrow.down.right",
                                color: Color("Error"))
                        }
                        
                        HStack(spacing: 0) {
                            ForEach(tabs.indices, id: \.self) { index in
                                Button {
                                    withAnimation {
                                        selectedTab = index
                                    }
                                } label: {
                                    Text(tabs[index])
                                        .fontWeight(.semibold)
                                        .foregroundStyle(selectedTab == index ? Color("Foreground") : Color("TextMuted"))
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 4)
                                        .background(selectedTab == index ? Color("Accent") : Color.clear)
                                        .clipShape(Capsule())
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(4)
                        .background(Color("Surface"))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(Color("Border"), lineWidth: 1)
                        }
                        .padding()
                        
                        LazyVStack(spacing: 0){
                            ForEach(transactions.indices, id: \.self) { transaction in
                                TransactionsRow(transaction: transactions[transaction])
                                
                                if transaction != transactions.indices.last {
                                    Divider()
                                        .overlay(Color("Border"))
                                        .padding(.horizontal, 20)
                                }
                            }
                            
                        }
                        .background(Color("Surface"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("Border"), lineWidth: 1)
                        }
                        .padding(.horizontal)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ExpensesView()
}
