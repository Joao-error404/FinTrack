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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: FinancialTransaction.self)
    }
}
