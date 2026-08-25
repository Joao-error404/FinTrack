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
                    .fill(Color("Surface"))
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
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                ScrollView {
                    
                    VStack (alignment: .leading){
                        Text("Transactions")
                            .foregroundStyle(Color("Foreground"))
                            .font(.title)
                            .fontWeight(.bold)
                        Text("\(totalTransactions) transactions - \(actualMonth)")
                            .foregroundStyle(Color("TextMuted"))
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    VStack {
                        HStack(spacing: 20){
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(Color("Success").opacity(0.2))
                                        .frame(width: 30, height: 30)
                                    
                                    Image(systemName: "arrow.up.right")
                                        .font(.system(size: 10))
                                        .foregroundStyle(Color("Success"))
                                }
                                
                                VStack(alignment: .leading){
                                    Text("Income")
                                        .font(.caption)
                                        .foregroundStyle(Color("TextMuted"))
                                    Text(formattedNumber(totalEarnings))
                                        .font(.headline)
                                        .lineLimit(1)
                                        .foregroundStyle(Color("Foreground"))
                                        .fontWeight(.bold)
                                }
                            }
                            .frameStyle()
                            
                            HStack{
                                ZStack {
                                    Circle()
                                        .fill(Color("Error").opacity(0.2))
                                        .frame(width: 30, height: 30)
                                    
                                    Image(systemName: "arrow.down.right")
                                        .font(.system(size: 10))
                                        .foregroundStyle(Color("Error"))
                                }
                                VStack(alignment: .leading){
                                    Text("Expenses")
                                        .font(.caption)
                                        .foregroundStyle(Color("TextMuted"))
                                    Text(formattedNumber(totalExpenses))
                                        .font(.headline)
                                        .lineLimit(1)
                                        .foregroundStyle(Color("Foreground"))
                                        .fontWeight(.bold)
                                    
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
                        .padding()
                        
                        LazyVStack(spacing: 12){
                            HStack{
                                Image(systemName: "heart.fill")
                                VStack(alignment: .leading) {
                                    Text("Title")
                                        .font(.headline)
                                        .lineLimit(1)
                                        .foregroundStyle(Color("Foreground"))
                                    Text("Subtitle")
                                        .font(.subheadline)
                                        .foregroundStyle(Color("TextMuted"))
                                        .lineLimit(1)
                                }
                                .padding(.horizontal, 10)
                                Spacer()
                                Text("R$0,00")
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color("Foreground"))
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color("Surface"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    ExpensesView()
}
