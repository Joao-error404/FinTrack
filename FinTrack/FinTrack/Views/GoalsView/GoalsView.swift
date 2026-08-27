//
//  GoalsView.swift
//  FinTrack
//
//  Created by breno.farias on 27/08/26.
//

import SwiftUI
import SwiftData

struct GoalsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Goal.deadline) private var goals: [Goal]
    
    let cardColors: [(color: Color, darker: Color)] = [
        (Color("Accent"), .purple),
        (.blue, .cyan),
        (.green, .mint),
        (.orange, .red),
        (.pink, .purple)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea(edges: .all)
                
                ScrollView {
                    VStack (spacing: 24) {
                        GoalsHeader(totalGoals: goals.count)
                        GoalsProgressCard()
                        
                        LazyVStack (spacing: 16) {
                            ForEach(cardColors.indices, id: \.self) { index in
                                let colors = cardColors[index]
                                GoalCard(color: colors.color, colorDarker: colors.darker)
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    GoalsView()
}
