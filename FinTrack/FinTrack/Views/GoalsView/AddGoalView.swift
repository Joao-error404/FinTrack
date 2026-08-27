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
    @State private var hasDeadline = true
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
    
    private let icons = [
        "target",
        "house.fill",
        "car.fill",
        "airplane",
        "graduationcap.fill",
        "heart.fill",
        "star.fill",
        "gift.fill",
        "briefcase.fill"
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Goal") {
                    TextField("Goal's name", text: $title)
                    TextField("Target amount", value: $targetAmount, format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
                        .keyboardType(.decimalPad)
                    TextField("Current amount", value: $currentAmount, format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
                        .keyboardType(.decimalPad)
                    
                }
                
                Section("Deadline") {
                    Toggle("Set deadline", isOn: $hasDeadline)
                    
                    if hasDeadline {
                        DatePicker("Deadline", selection: $deadline, displayedComponents: .date)
                    }
                }
                
                Section("Appearance") {
                    Picker("Icon", selection: $icon) {
                        ForEach(icons, id: \.self) { iconName in
                            Label(iconName, systemImage: iconName)
                                .tag(iconName)
                        }
                    }
                    
                    HStack {
                            Text("Color")
                            Spacer()

                            ForEach(GoalColor.allCases) { goalColor in
                                Button {
                                    colorName = goalColor.rawValue
                                } label: {
                                    Circle()
                                        .fill(goalColor.color)
                                        .frame(width: 28, height: 28)
                                        .overlay {
                                            if colorName == goalColor.rawValue {
                                                Image(systemName: "checkmark")
                                                    .font(.caption.bold())
                                                    .foregroundStyle(.white)
                                            }
                                        }
                                }
                                .buttonStyle(.plain)
                                .accessibilityLabel(goalColor.rawValue)
                            }
                        }
                }
                
                Section {
                    Button("Add goal") {
                        saveGoal()
                    }
                    .frame(maxWidth: .infinity)
                    .disabled(!isFormValid)
                }
            }
            .navigationTitle("New goal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
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
            targetAmount: targetAmount,
            currentAmount: currentAmount,
            createdAt: .now,
            icon: icon,
            colorName: colorName
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
