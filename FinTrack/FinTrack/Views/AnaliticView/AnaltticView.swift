//
//  AnaliticView.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 04/09/26.
//

import SwiftUI
import SwiftData
import Charts
struct AnalyticView: View {
    
    @State private var showingTab = false
    @State private var selectedTab = 0
    
    @Environment(\.modelContext) private var modelContext
    
    
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
    
    private var balanceHistory: [BalancePoint] {
        let sortedTransactions = transactions
            .sorted { $0.date < $1.date }
        var currentBalance = 0.0
        return sortedTransactions.map { transaction in
            if transaction.type == .income {
                currentBalance += transaction.amount
            } else {
                currentBalance -= transaction.amount
            }
            return BalancePoint(
                date: transaction.date,
                balance: currentBalance
            )
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack (alignment: .topTrailing){
                Color("Background")
                    .ignoresSafeArea()
                ScrollView {
                    AnalyticsHeader()
                    
                    VStack {
                        HStack{
                            AnalyticsSummaryCard(
                                title: "Incomes",
                                amount: totalIncome,
                                icon: "arrow.up.right",
                                color: Color("Success"))
                            
                            AnalyticsSummaryCard(
                                title: "Expenses",
                                amount: totalExpense,
                                icon: "arrow.down.right",
                                color: Color("Error"))
                            
                            AnalyticsSummaryCard(
                                title: "Balance",
                                amount: balance,
                                icon: "arrow.down.right",
                                color: Color("Success"))
                            
                        }
                        
                        AnalyticsFilterTab(selectedTab: $selectedTab)
                        if(selectedTab == 0){
                            Spacer()
                            Text("Progress")
                            Spacer()
                            Chart(balanceHistory){
                                point in
                                AreaMark(
                                    x: .value("Date", point.date),
                                    y: .value("Balance", point.balance)
                                )
                                .foregroundStyle(
                                    .indigo.opacity(0.3)
                                )
                                
                                LineMark(
                                    x: .value("Date", point.date),
                                    y: .value("Balance", point.balance)
                                )
                                .foregroundStyle(
                                    .indigo)
                                .lineStyle(
                                    StrokeStyle(lineWidth: 3)
                                )
                            }
                            .frame(height: 250)
                            .padding(.horizontal)
                        }
                       
                        
                    }
                    
                }
            }
            .sheet(isPresented: $showingTab) {
                AddTransactionView()
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.height(700)])
            }
        }
    }
}
