//
//  ExpensesView.swift
//  FinTrack
//
//  Created by breno.farias on 24/08/26.
//

import SwiftUI

struct FrameModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, minHeight: 80, alignment: .leading)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                    .shadow(
                        color: .black.opacity(0.1),
                        radius: 6
                    )
            }
    }
}

extension View {
    func frameStyle() -> some View {
        modifier(FrameModifier())
    }
}

struct ExpensesView: View {
    @State private var totalTransactions = 0
    @State private var totalEarnings = 0.0
    @State private var totalExpenses = 0.0
    @State private var actualMonth = currentMonth
    
    @State private var selectedTab = 0
    
    let tabs = [
        "All",
        "Income",
        "Expense"
    ]
    
    static var currentMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "MMMM"
        
        let monthName = dateFormatter.string(from: Date())
        return monthName
    }
    
    func formattedNumber (_ number: Double) -> String {
        let currencyCode = Locale.current.currency?.identifier ?? "BRL"
        
        if number >= 100_000 {
            return String(format: "%.0fK", number / 1_000)
        }
        
        return number.formatted(.currency(code: currencyCode))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack(spacing: 20){
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(Color.green.opacity(0.2))
                                    .frame(width: 30, height: 30)
                                
                                Image(systemName: "arrow.up.right")
                                    .font(.system(size: 10))
                                    .foregroundStyle(Color.green)
                            }
                            
                            VStack(alignment: .leading){
                                Text("Income")
                                    .font(.caption)
                                Text(formattedNumber(totalEarnings))
                                    .font(.headline)
                                    .lineLimit(1)
                            }
                        }
                        .frameStyle()
                        
                        HStack{
                            ZStack {
                                Circle()
                                    .fill(Color.red.opacity(0.5))
                                    .frame(width: 30, height: 30)
                                
                                Image(systemName: "arrow.down.right")
                                    .font(.system(size: 10))
                                    .foregroundStyle(Color.red)
                            }
                            VStack(alignment: .leading){
                                Text("Expenses")
                                    .font(.caption)
                                Text(formattedNumber(totalExpenses))
                                    .font(.headline)
                                    .lineLimit(1)
                                
                            }
                        }
                        .frameStyle()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    HStack(spacing: 0) {
                        ForEach(tabs.indices, id: \.self) { index in
                            Button {
                                withAnimation {
                                    selectedTab = index
                                }
                            } label: {
                                Text(tabs[index])
                                    .fontWeight(.semibold)
                                    .foregroundStyle(selectedTab == index ? .white : .secondary)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 4)
                                    .background(selectedTab == index ? Color.blue : Color.clear)
                                    .clipShape(Capsule())
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(4)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(Capsule())
                    .padding()
                    
                    LazyVStack(spacing: 12){
                        HStack{
                            Image(systemName: "heart.fill")
                            VStack(alignment: .leading) {
                                Text("Title")
                                    .font(.headline)
                                    .lineLimit(1)
                                Text("Subtitle")
                                    .font(.subheadline)
                                    .foregroundStyle(Color.secondary)
                                    .lineLimit(1)
                            }
                            .padding(.horizontal, 10)
                            Spacer()
                            Text("R$0,00")
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Transactions")
            .navigationSubtitle("\(totalTransactions) transactions - \(actualMonth)")
        }
    }
}

#Preview {
    ExpensesView()
}
