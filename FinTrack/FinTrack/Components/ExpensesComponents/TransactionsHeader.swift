//
//  TransactionsHeader.swift
//  FinTrack
//
//  Created by breno.farias on 26/08/26.
//

import SwiftUI

struct TransactionsHeader: View {
    let transactionCount: Int
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Transactions")
                .foregroundStyle(Color("Foreground"))
                .font(.title)
                .fontWeight(.bold)
            Text("\(transactionCount) transactions - \(Date.currentMonthName)")
                .foregroundStyle(Color("TextMuted"))
                .font(.footnote)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.top, 20)
    }
}
