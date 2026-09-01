//
//  AddTransactionButton.swift
//  FinTrack
//
//  Created by breno.farias on 01/09/26.
//

import SwiftUI

struct AddTransactionButton: View {
    @Binding var type: TransactionType
    let isFormValid: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Add Transaction")
                .frame(maxWidth: .infinity, maxHeight: 50)
        }
        .buttonStyle(.borderedProminent)
        .tint(type == .expense ? .red : .green)
        .disabled(!isFormValid)
        .foregroundStyle(Color("Foreground"))
        .fontWeight(.bold)
    }
}

#Preview {
    @Previewable @State var type: TransactionType = .expense
    AddTransactionButton(type: $type, isFormValid: true) {
        print("teste")
    }
}
