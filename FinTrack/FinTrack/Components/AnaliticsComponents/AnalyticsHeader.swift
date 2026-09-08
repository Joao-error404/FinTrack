//
//  AnaliticsHeader.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 04/09/26.
//

import SwiftUI

struct AnalyticsHeader: View {
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Analitics")
                .foregroundStyle(Color("Foreground"))
                .font(.title)
                .fontWeight(.bold)
            Text("\(Date.currentMonthName)")
                .foregroundStyle(Color("TextMuted"))
                .font(.footnote)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.top, 20)
    }
}
