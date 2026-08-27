//
//  TransactiontRowView.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 24/08/26.
//
import SwiftUI

struct TransactionRowView: View {

    let transaction: FinancialTransaction

    private var transactionColor: Color {
        transaction.type == .income ? .green : .red
    }

    private var valuePrefix: String {
        transaction.type == .income ? "+" : "-"
    }

    var body: some View {
        HStack(spacing: 14) {
            Circle()
                .fill(transactionColor.opacity(0.15))
                .frame(width: 50, height: 50)
                .overlay {
                    Image(systemName: transaction.category.icon)
                        .foregroundStyle(transactionColor)
                }

            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.title)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)

                Text(
                    "\(transaction.category.title) · "
                    + transaction.date.formatted(
                        date: .abbreviated,
                        time: .omitted
                    )
                )
                .foregroundStyle(.gray)
                .font(.subheadline)
            }

            Spacer()

            Text(
                "\(valuePrefix)\(transaction.amount.formattedCurrency)"
            )
            .foregroundStyle(transactionColor)
            .fontWeight(.bold)
        }
        .padding(.vertical, 12)
    }
}
