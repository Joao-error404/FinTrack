//
//  SummaryCard.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 24/08/26.
//

import SwiftUI

struct SummaryCard: View {

    let icon: String
    let title: String
    let value: String
    let color: Color

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Image(systemName: icon)
                .foregroundColor(color)

            Text(title)
                .foregroundColor(Color("TextMuted"))

            Text(value)
                .font(.title3)
                .bold()
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("Surface"))
        .cornerRadius(24)
    }
}
