//
//  TransactiontRowView.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 24/08/26.
//

import SwiftUI

struct TransactionRowView: View {

    let icon: String
    let title: String
    let subtitle: String
    let value: String
    let color: Color

    var body: some View {

        HStack {

            Circle()
                .fill(Color.orange.opacity(0.2))
                .frame(width: 50, height: 50)
                .overlay(
                    Image(systemName: icon)
                        .foregroundColor(.orange)
                )

            VStack(alignment: .leading) {

                Text(title)
                    .foregroundColor(.white)
                    .bold()

                Text(subtitle)
                    .foregroundColor(.gray)
            }

            Spacer()

            Text(value)
                .foregroundColor(color)
                .bold()
        }
        .padding(.vertical, 12)
    }
}
