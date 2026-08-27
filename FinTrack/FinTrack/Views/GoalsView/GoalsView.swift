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
    
    @State private var showingAddGoal = false
    
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
                            ForEach(goals, id: \.id) { goal in
                                GoalCard(goal: goal)
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddGoal = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddGoal) {
                AddGoalView()
            }
        }
    }
}

#Preview {
    GoalsView()
}
