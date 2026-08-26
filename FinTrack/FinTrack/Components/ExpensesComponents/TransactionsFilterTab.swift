//
//  TransactionsFilterTab.swift
//  FinTrack
//
//  Created by breno.farias on 26/08/26.
//

import SwiftUI

struct TransactionsFilterTab: View {
    let tabs = [
        "All",
        "Income",
        "Expense"
    ]
    
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs.indices, id: \.self) { index in
                Button {
                    withAnimation {
                        selectedTab = index
                    }
                } label: {
                    Text(tabs[index])
                        .fontWeight(.semibold)
                        .foregroundStyle(selectedTab == index ? Color("Foreground") : Color("TextMuted"))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 4)
                        .background(selectedTab == index ? Color("Accent") : Color.clear)
                        .clipShape(Capsule())
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(4)
        .background(Color("Surface"))
        .clipShape(Capsule())
        .overlay {
            Capsule()
                .stroke(Color("Border"), lineWidth: 1)
        }
        .padding()
    }
}
