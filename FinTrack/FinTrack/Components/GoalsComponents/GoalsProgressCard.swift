//
//  GoalsProgressCard.swift
//  FinTrack
//
//  Created by breno.farias on 27/08/26.
//

import SwiftUI

struct GoalsProgressCard: View {
    let goals: [Goal]
    
    private var totalTargetAmount: Double {
        goals.reduce(0) { partialResult, goal in
            partialResult + goal.targetAmount
        }
    }
    
    private var totalCurrentAmount: Double {
        goals.reduce(0) { partialResult, goal in
            partialResult + goal.currentAmount
        }
    }

    private var overallProgress: Double {
        guard totalTargetAmount > 0 else { return 0 }
        return min(totalCurrentAmount / totalTargetAmount, 1)
    }
    
    var body: some View {
        VStack (alignment: .leading){
            HStack () {
                Text("Overall Progress")
                    .foregroundStyle(Color("Foreground"))

                Spacer()

                Text(overallProgress, format: .percent.precision(.fractionLength(0)))
                    .foregroundStyle(Color("Accent"))
            }
            .padding(.horizontal, 4)
            .fontWeight(.bold)
            .lineLimit(1)
            
            
            ProgressView(value: overallProgress)
                .tint(
                    LinearGradient(
                        colors: [
                            Color("Accent"),
                            Color.purple
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .padding(.vertical, 8)
                .scaleEffect(y: 2, anchor: .center)
            
            HStack (){
                Text(totalCurrentAmount.formattedCurrency)
                
                Spacer()
                
                Text("of \(totalTargetAmount.formattedCurrency)")
            }
            .foregroundStyle(Color("TextMuted"))
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 130)
        .frameStyle()
    }
}

#Preview {
    GoalsProgressCard(
            goals: [
                Goal(
                    id: UUID(),
                    title: "Viagem",
                    targetAmount: 10_000,
                    currentAmount: 4_000,
                    createdAt: .now,
                    icon: "airplane"
                ),
                Goal(
                    id: UUID(),
                    title: "Emergencia",
                    targetAmount: 5_000,
                    currentAmount: 2_500,
                    createdAt: .now,
                    icon: "cross.case"
                )
            ]
        )
        .padding()
        .background(Color("Background"))
}
