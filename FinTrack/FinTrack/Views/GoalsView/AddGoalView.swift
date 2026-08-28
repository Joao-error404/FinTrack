//
//  AddGoalView.swift
//  FinTrack
//
//  Created by breno.farias on 27/08/26.
//

import SwiftUI
import SwiftData

struct AddGoalView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var targetAmount = 0.0
    @State private var currentAmount = 0.0
    @State private var deadline = Date()
    @State private var hasDeadline = false
    @State private var icon = "target"
    @State private var colorName = GoalColor.accent.rawValue
    
    @State private var showError = false
    @State private var errorMessage = ""
    
    private var isFormValid: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        && targetAmount > 0
        && currentAmount >= 0
        && currentAmount <= targetAmount
    }
    
    var body: some View {
        NavigationStack {
            ZStack (alignment: .top){
                Color("Background")
                    .ignoresSafeArea()
                
                VStack {
                    GoalSection(title: $title, targetAmount: $targetAmount, currentAmount: $currentAmount)
                    
                    DeadlineSection(hasDeadline: $hasDeadline, deadline: $deadline)
                    
                    AppearenceSection(icon: $icon, colorName: $colorName)
                    
                    AddGoalButton(isFormValid: isFormValid, action: saveGoal)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Add goal")
                        .foregroundStyle(Color("Foreground"))
                        .font(.headline)
                        .fontWeight(.bold)
                }
            }
            .alert("Error", isPresented: $showError) {
                Button("Ok", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
            
        }
    }
    
    private func saveGoal() {
        let goal = Goal(
            id: UUID(),
            title: title.trimmingCharacters(in: .whitespacesAndNewlines),
            deadline: hasDeadline ? deadline : nil,
            targetAmount: targetAmount,
            currentAmount: currentAmount,
            createdAt: .now,
            icon: icon,
            colorName: colorName,
        )
        modelContext.insert(goal)
        
        do {
            try modelContext.save()
            dismiss()
        } catch {
            showError = true
            errorMessage = error.localizedDescription
        }
    }
}

#Preview {
    AddGoalView()
}
