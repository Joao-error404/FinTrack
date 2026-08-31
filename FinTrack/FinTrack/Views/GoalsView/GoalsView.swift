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
            ZStack (alignment: .topTrailing){
                Color("Background")
                    .ignoresSafeArea(edges: .all)
                
                List {
                    GoalsHeader(totalGoals: goals.count)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                    
                    GoalsProgressCard(goals: goals)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .padding(.top, 20)

                    ForEach(goals, id: \.id) { goal in
                        GoalCard(goal: goal)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    deleteGoal(goal)
                                } label: {
                                    Label("Excluir", systemImage: "trash")
                                }
                            }
                            .listRowInsets(EdgeInsets())
                            .padding(.top)

                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .padding(.horizontal)
                
                CircleAddGoalButton(showingAddGoal: $showingAddGoal)
            }
            .sheet(isPresented: $showingAddGoal) {
                AddGoalView()
            }
        }
        
    }
    
    private func deleteGoal(_ goal: Goal) {
        modelContext.delete(goal)

        do {
            try modelContext.save()
        } catch {
            print("Erro ao excluir meta: \(error.localizedDescription)")
        }
    }
}

#Preview {
    GoalsView()
}
