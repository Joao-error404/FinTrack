//
//  FinTrackApp.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 21/08/26.
//

import SwiftUI

@main
struct FinTrackApp: App {
    
    @State private var selectedTab = "dashboard"
    
    var body: some Scene {
        WindowGroup {
            TabView (selection: $selectedTab) {
                FinanceDashboardView()
                    .tabItem {
                        Label("Dashboard", systemImage: "house.fill")
                    }
                    .tag("dashboard")
                ExpensesView()
                    .tabItem {
                        Label("Transactions", systemImage: "wallet.bifold")
                    }
                    .tag("transactions")
            }
            .preferredColorScheme(.dark)
        }
    }
}
