//
//  TransactionsRow.swift
//  FinTrack
//
//  Created by breno.farias on 26/08/26.
//

import SwiftUI

struct TransactionsRow: View {
    let transaction: FinancialTransaction
    
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: transaction.category.icon)
                .foregroundStyle(Color("Accent"))
                .frame(width: 32, height: 32)
                .background(Color("Accent").opacity(0.15))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 3) {
                Text(transaction.title)
                    .font(.headline)
                    .lineLimit(1)
                    .foregroundStyle(Color("Foreground"))
                Text(transaction.category.rawValue)
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundStyle(Color("TextMuted"))
                
            }
            
            Spacer(minLength: 12)
            if(transaction.type == .income){
                Text("+\(transaction.amount.formattedCurrency)")
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundColor(Color.green)
            }else {
                if(transaction.type == .expense){
                    Text("-\(transaction.amount.formattedCurrency)")
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .foregroundColor(Color.red)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
    }
}
