//
//  TransactionTypeSelector.swift
//  FinTrack
//
//  Created by breno.farias on 31/08/26.
//

import SwiftUI

struct TransactionTypeSelector: View {
    @Binding var type: TransactionType

    var body: some View {
        HStack (spacing: 4){
            option(title: "Expense", value: .expense, color: .red)
            option(title: "Income", value: .income, color: .green)
        }
        .padding(4)
        .background(Color("SurfaceSecondary"))
        .clipShape(Capsule())
        .overlay {
            Capsule()
                .stroke(Color("Border"), lineWidth: 1)
        }
    }
    
    @ViewBuilder
    private func option (
        title: String,
        value: TransactionType,
        color: Color
    ) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                type = value
            }
        } label: {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .foregroundStyle(type == value ? Color("Foreground") : Color("TextMuted"))
                .background {
                    if type == value {
                        Capsule()
                            .fill(color)
                    }
                }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    @Previewable @State var type: TransactionType = .expense
    TransactionTypeSelector(type: $type)
}
