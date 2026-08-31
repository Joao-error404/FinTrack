//
//  TransactionAmountInput.swift
//  FinTrack
//
//  Created by breno.farias on 31/08/26.
//

import SwiftUI

struct TransactionAmountInput: View {
    @Binding var amount: Double
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        
        TextField("", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
            .padding()
            .frame(height: 80)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(Color("TextMuted"))
            .background(Color("SurfaceSecondary"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("Border"), lineWidth: 1)
            }
            .focused($isFocused)
            .keyboardType(.decimalPad)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
    }
    
}

#Preview {
    @Previewable @State var amount: Double = 0.0
    @Previewable @FocusState var isFocused: Bool
    TransactionAmountInput(amount: $amount, isFocused: $isFocused)
}
