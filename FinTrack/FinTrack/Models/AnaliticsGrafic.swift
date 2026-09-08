//
//  AnaliticsGrafic.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 04/09/26.
//

import Charts
import Foundation

struct BalancePoint: Identifiable {

    let id = UUID()
    let date: Date
    let balance: Double
}
