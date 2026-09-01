//
//  TransactionCategoryInput.swift
//  FinTrack
//
//  Created by breno.farias on 31/08/26.
//

import SwiftUI

struct TransactionCategoryInput: View {
    @Binding var category: TransactionCategory
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack (alignment: .leading){
            Text("Category")
                .foregroundStyle(Color("TextSecondary"))
                .fontWeight(.semibold)
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(TransactionCategory.allCases) { item in
                    Button {
                        category = item
                    } label: {
                        TransactionCategoryCard(category: item, isSelected: category == item)
                    }
                    .buttonStyle(.plain)
                }
            }
            .foregroundStyle(Color("TextSecondary"))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

#Preview {
    @Previewable @State var category: TransactionCategory = .other
    TransactionCategoryInput(category: $category)
}
