//
//  CurrentMonthExtension.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 21/08/26.
//

import Foundation

extension Date {
    static var currentMonthName: String {
        Date.now.formatted(
            Date.FormatStyle()
                .month(.wide)
                .locale(Locale(identifier: "en_US"))
        )
    }
}
