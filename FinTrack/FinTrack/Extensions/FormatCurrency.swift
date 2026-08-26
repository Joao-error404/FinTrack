//
//  FormatCurrency.swift
//  FinTrack
//
//  Created by breno.farias on 26/08/26.
//

import Foundation

extension Double {
    var formattedCurrency: String {
        let currencyCode = Locale.current.currency?.identifier ?? "BRL"
        return self.formatted(.currency(code: currencyCode))
    }
}
