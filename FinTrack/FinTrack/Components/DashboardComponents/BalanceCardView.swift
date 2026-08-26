//
//  BalanceCardView.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 21/08/26.
//

import SwiftUI

struct BalanceCardView: View {

    var body: some View {

        VStack(alignment: .leading, spacing: 18) {

            Text("Saldo atual")
                .font(.headline)

            Text("R$ 6.809,88")
                .font(.system(size: 42, weight: .bold))

            HStack {
                Text("64%")
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(.white.opacity(0.25))
                    .clipShape(Capsule())

                Text("deste mês")
            }

            Divider()

            HStack {

                VStack(alignment: .leading) {

                    Text("Receitas")
                        .foregroundColor(.white.opacity(0.8))

                    Text("R$ 10.6k")
                        .font(.title3)
                        .bold()
                }

                Spacer()

                VStack(alignment: .leading) {

                    Text("Despesas")
                        .foregroundColor(.white.opacity(0.8))

                    Text("R$ 3.8k")
                        .font(.title3)
                        .bold()
                }
            }
        }
        .padding(24)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [
                    Color.indigo,
                    Color.purple
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(30)
    }
}
