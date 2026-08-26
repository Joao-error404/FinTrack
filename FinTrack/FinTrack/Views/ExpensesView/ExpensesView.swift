//
//  ExpensesView.swift
//  FinTrack
//
//  Created by breno.farias on 24/08/26.
//

import SwiftUI

struct ExpensesView: View {
    @StateObject private var viewModel = ExpensesViewModel()
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                ScrollView {
                    
                    TransactionsHeader(transactionCount: viewModel.transactions.count)
                    
                    VStack {
                        HStack{
                            TransactionsSummaryCard(
                                title: "Incomes",
                                amount: viewModel.totalIncomes,
                                icon: "arrow.up.right",
                                color: Color("Success"))
                            
                            TransactionsSummaryCard(
                                title: "Expenses",
                                amount: viewModel.totalExpenses,
                                icon: "arrow.down.right",
                                color: Color("Error"))
                        }
                        
                        TransactionsFilterTab(selectedTab: $selectedTab)
                        
                        TransactionsList(transactions: viewModel.transactions)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ExpensesView()
}
