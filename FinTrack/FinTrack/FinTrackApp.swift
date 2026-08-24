//
//  FinTrackApp.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 21/08/26.
//

import SwiftUI

@main
struct FinTrackApp: App {
    
    @State private var selectedTab = "home"
    
    var body: some Scene {
        WindowGroup {
            TabView (selection: $selectedTab) {
                ExpensesView()
                    .tabItem {
                        Label("Expenses", systemImage: "wallet.bifold")
                    }
                    .tag("expenses")
            }
        }
    }
}
