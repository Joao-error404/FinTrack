//
//  TransactionsSummaryCard.swift
//  FinTrack
//
//  Created by breno.farias on 26/08/26.
//

import SwiftUI

struct FrameModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, minHeight: 80, alignment: .leading)
            .background {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color("Surface"))
                    .shadow(
                        color: .black.opacity(0.1),
                        radius: 6
                    )
            }
            .overlay {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color("Border"), lineWidth: 1)
            }
    }
}

extension View {
    func frameStyle() -> some View {
        modifier(FrameModifier())
    }
}

struct TransactionsSummaryCard: View {
    let title: String
    let amount: Double
    let icon: String
    let color: Color
    
    func formattedNumber (_ number: Double) -> String {
        let currencyCode = Locale.current.currency?.identifier ?? "BRL"
        
        if number >= 100_000 {
            return String(format: "%.0fK", number / 1_000)
        }
        
        return number.formatted(.currency(code: currencyCode))
    }
    
    var body: some View {
        HStack(spacing: 20){
            HStack {
                ZStack {
                    Circle()
                        .fill(color.opacity(0.2))
                        .frame(width: 30, height: 30)
                    
                    Image(systemName: icon)
                        .font(.system(size: 10))
                        .foregroundStyle(color)
                }
                
                VStack(alignment: .leading){
                    Text(title)
                        .font(.caption)
                        .foregroundStyle(Color("TextMuted"))
                    Text(formattedNumber(amount))
                        .font(.headline)
                        .lineLimit(1)
                        .foregroundStyle(Color("Foreground"))
                        .fontWeight(.bold)
                }
            }
            .frameStyle()
        }
    }
}
