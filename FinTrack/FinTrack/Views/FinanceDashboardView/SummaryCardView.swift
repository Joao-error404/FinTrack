//
//  SummaryCardView.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 24/08/26.
//

import SwiftUI

struct SummaryCardsView: View {

    var body: some View {

        HStack(spacing: 16) {

            SummaryCard(
                icon: "arrow.up.right",
                title: "Saldo líquido",
                value: "R$ 6.8k",
                color: .indigo
            )

            SummaryCard(
                icon: "arrow.down.right",
                title: "Total gastos",
                value: "R$ 3.8k",
                color: .red
            )

            SummaryCard(
                icon: "chart.line.uptrend.xyaxis",
                title: "Entradas",
                value: "R$ 10.6k",
                color: .green
            )
        }
    }
}
