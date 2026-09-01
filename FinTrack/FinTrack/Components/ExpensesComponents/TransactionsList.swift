//
//  TransactionsList.swift
//  FinTrack
//
//  Created by breno.farias on 26/08/26.
//

import SwiftUI

struct TransactionsList: View {
    let transactions: [FinancialTransaction]
    let onDelete: (FinancialTransaction) -> Void
    @Binding var selectedTab: Int

    
    var filteredTransactions: [FinancialTransaction] {
    switch selectedTab {
    case 1:
        return transactions.filter { $0.type == .income }

    case 2:
        return transactions.filter { $0.type == .expense }

    default:
        return transactions
    }
}

    
    var body: some View {
        LazyVStack(spacing: 0){
            ForEach(filteredTransactions) { transaction in
                TransactionsRow(transaction: transaction)
                    .contextMenu {
                        Button(role: .destructive) {
                            onDelete(transaction)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                
                if transaction.id != filteredTransactions.last?.id {
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
