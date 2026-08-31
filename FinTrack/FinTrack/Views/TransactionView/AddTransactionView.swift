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
    
    @State private var title = ""
    @State private var amount = 0.0
    @State private var type: TransactionType = .expense
    @State private var category: TransactionCategory = .other
    @State private var date: Date = .now
    @FocusState private var isFocused: Bool

    private var isFormValid: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        && amount > 0
    }

    var body: some View {
        NavigationStack {
            ZStack (alignment: .top){
                Color("Background")
                    .ignoresSafeArea()
                
                    VStack (spacing: 16){
                        TransactionTypeSelector(type: $type)
                        TransactionAmountInput(amount: $amount, isFocused: $isFocused)
                        TransactionDateInput(date: $date)
                        TransactionCategoryInput(category: $category)
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
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
            date: date,
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
