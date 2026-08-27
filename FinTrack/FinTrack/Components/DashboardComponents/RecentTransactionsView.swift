//
//  RecentTransactionsView.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 24/08/26.
//

import SwiftUI

struct RecentTransactionsView: View {
    
    let transactions: [FinancialTransaction]

    var body: some View {
        VStack(alignment: .leading) {

            HStack {

                Text("Recentes")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Spacer()

                Button("Ver todos") {

                }
                .foregroundColor(Color("Accent"))
            }
            
                   if transactions.isEmpty {
                       ContentUnavailableView(
                        "Nenhuma transação recente",
                        systemImage: "tray",
                        description: Text("Clique no botão + para adicionar uma transação.")
                       ).foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                       
                        .background(Color.white.opacity(0.05))
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                       
                   }else{
                       
                       VStack(spacing: 0) {
                           ForEach(transactions){ transaction in TransactionsRow(transaction: transaction)
                               
                               if transaction.id != transactions.last?.id{
                                   Divider()
                                   
                                       .overlay(Color.white.opacity(0.1))
                                       }
                               }
                       }
                       .padding()
                       .background(Color.white.opacity(0.05))
                       .clipShape(RoundedRectangle(cornerRadius: 24))
                       }
        }
    }
}
