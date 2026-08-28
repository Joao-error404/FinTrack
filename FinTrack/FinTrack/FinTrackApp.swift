//
//  FinTrackApp.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 21/08/26.
//

import SwiftUI
import SwiftData

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
                
                AddTransactionView(selectedTab: $selectedTab)
                    .tabItem {
                        Label("Add", systemImage: "plus.circle.fill")
                    }
                    .tag("add")
                
                ExpensesView()
                    .tabItem {
                        Label("Transactions", systemImage: "wallet.bifold")
                    }
                    .tag("transactions")
                GoalsView()
                    .tabItem {
                        Label("Goals", systemImage: "target")
                    }
                    .tag("goals")
            }
            .preferredColorScheme(.dark)
        }
        .modelContainer(for: [FinancialTransaction.self, Goal.self])
    }
}
