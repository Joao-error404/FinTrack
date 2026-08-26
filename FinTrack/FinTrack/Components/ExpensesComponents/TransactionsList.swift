//
//  TransactionsList.swift
//  FinTrack
//
//  Created by breno.farias on 26/08/26.
//

import SwiftUI

struct TransactionsList: View {
    let transactions: [FinancialTransaction]
    
    var body: some View {
        LazyVStack(spacing: 0){
            ForEach(transactions) { transaction in
                TransactionsRow(transaction: transaction)
                
                if transaction != transactions.last {
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
