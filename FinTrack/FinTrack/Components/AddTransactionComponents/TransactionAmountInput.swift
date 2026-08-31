//
//  TransactionAmountInput.swift
//  FinTrack
//
//  Created by breno.farias on 31/08/26.
//

import SwiftUI

struct TransactionAmountInput: View {
    @Binding var amount: Double
    
    var body: some View {
        
        TextField("", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
            .padding()
            .frame(height: 80)
            .font(.title3)
            .foregroundStyle(Color("TextMuted"))
            .background(Color("SurfaceSecondary"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("Border"), lineWidth: 1)
            }
            
    }
}

#Preview {
    @Previewable @State var amount: Double = 0.0
    TransactionAmountInput(amount: $amount)
}
