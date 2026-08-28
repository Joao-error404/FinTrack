//
//  GoalSection.swift
//  FinTrack
//
//  Created by breno.farias on 27/08/26.
//

import SwiftUI

struct GoalSection: View {
    @Binding var title: String
    @Binding var targetAmount: Double
    @Binding var currentAmount: Double
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        VStack (){
            Text("Goal")
                .sectionTitleModifier()
            
            VStack (alignment: .leading, spacing: 2){
                Text("Goal's name")
                    .sectionTextFieldTitleModifier()
                
                TextField("",
                          text: $title,
                          prompt: Text("Ex.: Travel")
                    .foregroundStyle(Color("TextMuted")))
                .textFieldModifier()
                .focused($isFocused)
            }
            
            VStack (alignment: .leading, spacing: 2) {
                Text("Target amount")
                    .sectionTextFieldTitleModifier()
                
                TextField("Target amount",
                          value: $targetAmount,
                          format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
                .keyboardType(.decimalPad)
                .foregroundStyle(Color("Foreground"))
                .textFieldModifier()
                .focused($isFocused)
            }
            
            VStack (alignment: .leading, spacing: 2){
                Text("Current Amount")
                    .sectionTextFieldTitleModifier()
                
                TextField("Current amount", value: $currentAmount, format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
                    .keyboardType(.decimalPad)
                    .foregroundStyle(Color("Foreground"))
                    .textFieldModifier()
                    .focused($isFocused)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 250)
        .frameStyle()
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isFocused = false
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var title: String = ""
    @Previewable @State var targetAmount: Double = 0.0
    @Previewable @State var currentAmount: Double = 0.0
    @Previewable @FocusState var isFocused: Bool
    GoalSection(title: $title, targetAmount: $targetAmount, currentAmount: $currentAmount, isFocused: $isFocused)
}
