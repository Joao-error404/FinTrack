//
//  GoalCard.swift
//  FinTrack
//
//  Created by breno.farias on 27/08/26.
//

import SwiftUI

struct GoalCard: View {
    let goal: Goal
    
    var body: some View {
        HStack (spacing: 40){
            
            Image(systemName: goal.icon)
                .font(.system(size: 30))
                .foregroundStyle(goal.goalColor.color)
            
            VStack {
                VStack (alignment: .leading) {
                    HStack {
                        Text(goal.title)
                            .foregroundStyle(Color("Foreground"))
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("\(goal.progress * 100, format: .number)%")
                            .foregroundStyle(goal.goalColor.color)
                            .fontWeight(.bold)
                    }
                    
                    if let deadline = goal.deadline {
                        Text("Deadline: \(deadline.formatted(date: .abbreviated, time: .omitted))")
                            .foregroundStyle(Color("TextMuted"))
                    } else {
                        Text("No deadline.")
                            .foregroundStyle(Color("TextMuted"))
                    }
                    
                }
                
                ProgressView(value: goal.progress)
                    .tint(
                        LinearGradient(
                            colors: [
                                goal.goalColor.color,
                                goal.goalColor.darkerColor
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .padding(.vertical, 8)
                    .scaleEffect(y: 2, anchor: .center)
                
                VStack (alignment: .leading){
                    HStack (){
                        Text(goal.currentAmount.formattedCurrency)
                        
                        Spacer()
                        
                        Text("/ \(goal.targetAmount.formattedCurrency)")
                    }
                    .foregroundStyle(Color("TextMuted"))
                    
                    HStack {
                        Text("Remaining")
                            .foregroundStyle(Color("TextMuted"))
                        Text(goal.remainingAmount.formattedCurrency)
                            .foregroundStyle(Color("Foreground"))
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 170)
        .frameStyle()
    }
}

#Preview {
    GoalCard(goal: Goal(id: UUID(), title: "Viagem", deadline: DateFormatter().date(from: "2029-01-01"), targetAmount: 100_000, currentAmount: 50_000, createdAt: .now, icon: "airplane"))
}
