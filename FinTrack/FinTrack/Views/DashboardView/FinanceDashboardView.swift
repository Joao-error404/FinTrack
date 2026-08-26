//
//  FinanceDashboardView.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 24/08/26.
//

import SwiftUI

struct FinanceDashboardView: View {

    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                ScrollView {
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
    }
}

#Preview {
    FinanceDashboardView()
}
