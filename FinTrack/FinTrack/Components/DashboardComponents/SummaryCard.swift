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
    let value: Double
    let color: Color

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            ZStack {
                Circle()
                    .fill(color.opacity(0.2))
                    .frame(width: 45, height: 45)

                Image(systemName: icon)
                    .foregroundStyle(color)
            }

            Text(title)
                .font(.subheadline)
                .foregroundStyle(Color("TextMuted"))

            Text(value.formattedCurrency)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color("CardBackground"))
        .clipShape(
            RoundedRectangle(
                cornerRadius: 24,
                style: .continuous
            )
        )
    }
}
