//
//  RecentTransactionsView.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 24/08/26.
//

import SwiftUI

struct RecentTransactionsView: View {

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
            
                VStack(spacing: 0) {
                    
                    TransactionRowView(
                        icon: "car.fill",
                        title: "Assado",
                        subtitle: "Transporte",
                        value: "-R$ 123,12",
                        color: Color("Error")
                    )
                    
                    Divider()
                    
                    TransactionRowView(
                        icon: "graduationcap.fill",
                        title: "Curso TypeScript",
                        subtitle: "Educação",
                        value: "-R$ 197,00",
                        color: Color("Error")
                    )
                    
                    Divider()
                    
                    TransactionRowView(
                        icon: "chart.line.uptrend.xyaxis",
                        title: "Dividendos",
                        subtitle: "Investimentos",
                        value: "+R$ 340,00",
                        color: Color("Success")
                    )
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(24)
            
            
        }
    }
}
