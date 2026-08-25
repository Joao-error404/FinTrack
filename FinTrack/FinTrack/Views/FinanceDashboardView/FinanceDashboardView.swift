//
//  FinanceDashboardView.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 24/08/26.
//

import SwiftUI

struct FinanceDashboardView: View {

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 24) {

                HeaderView()

                BalanceCardView()

                SummaryCardsView()

                RecentTransactionsView()

                Spacer()
            }
            .padding(20)
            

           
        }
    }
}
