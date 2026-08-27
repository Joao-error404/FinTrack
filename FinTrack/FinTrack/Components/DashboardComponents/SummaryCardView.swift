//
//  SummaryCardView.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 24/08/26.
//

import SwiftUI

struct SummaryCardsView: View {

    let balance: Double
    let income: Double
    let expense: Double
    
    var body: some View {

        HStack(spacing: 16) {

            SummaryCard(
                icon: "arrow.up.right",
                title: "Saldo líquido",
                value: balance,
                color: Color("Accent")
            )

            SummaryCard(
                icon: "arrow.down.right",
                title: "Total gastos",
                value: expense,
                color: Color("Error")
            )

            SummaryCard(
                icon: "chart.line.uptrend.xyaxis",
                title: "Entradas",
                value: income,
                color: Color("Success")
            )
        }
    }
}
