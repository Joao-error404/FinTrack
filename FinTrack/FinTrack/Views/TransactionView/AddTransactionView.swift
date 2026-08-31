//
//  AddTransactionView.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 27/08/26.
//

import SwiftUI
import SwiftData

struct AddTransactionView: View {

    @Environment(\.modelContext)
    private var modelContext
    
    @Environment(\.dismiss)
    private var dismiss
    
//    @Binding var selectedTab: String
    @State private var title = ""
    @State private var amount = 0.0
    @State private var type: TransactionType = .expense
    @State private var category: TransactionCategory = .other

    private var isFormValid: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        && amount > 0
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                
                ScrollView {
                    TransactionTypeSelector(type: $type)
                }
                .padding(.horizontal)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button() {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("New Transaction")
                        .foregroundStyle(Color("Foreground"))
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
        }
        
    }

    private func saveTransaction() {
        let trimmedTitle = title.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        let transaction = FinancialTransaction(
            title: trimmedTitle,
            amount: amount,
            type: type,
            category: category
        )

        modelContext.insert(transaction)

        do {
            try modelContext.save()
            dismiss()
        } catch {
            print("Erro ao salvar transação: \(error)")
        }
    }
}

#Preview {
//    @Previewable @State var selectedTab: String = "dashboard"
    AddTransactionView()
}
