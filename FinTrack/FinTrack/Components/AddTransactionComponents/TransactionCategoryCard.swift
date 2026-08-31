//
//  TransactionCategoryCard.swift
//  FinTrack
//
//  Created by breno.farias on 31/08/26.
//

import SwiftUI

struct TransactionCategoryCard: View {
    let category: TransactionCategory
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: category.icon)
                .font(.system(size: 20, weight: .medium))
                .frame(width: 20, height: 20)
                .foregroundStyle(isSelected ? category.color : Color("TextMuted"))
            Text(category.title)
                .foregroundStyle(isSelected ? category.color : Color("TextMuted"))
                .fontWeight(.semibold)
                .lineLimit(1)
                .font(.caption2)
        }
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(isSelected ? category.color.opacity(0.12) : Color("SurfaceSecondary"))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(isSelected ? category.color : Color("Border"), lineWidth: 1)
        }
        
    }
}

#Preview {
    var category: TransactionCategory = .food
    TransactionCategoryCard(category: category, isSelected: true)
}
