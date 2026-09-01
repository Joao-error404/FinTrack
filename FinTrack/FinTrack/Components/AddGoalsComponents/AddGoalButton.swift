//
//  AddGoalButton.swift
//  FinTrack
//
//  Created by breno.farias on 28/08/26.
//

import SwiftUI

struct AddGoalButton: View {
    let isFormValid: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Add goal")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .tint(Color("Accent"))
        .disabled(!isFormValid)
        .foregroundStyle(Color("Foreground"))
        .fontWeight(.bold)
        
    }
    
}

#Preview {
    AddGoalButton(isFormValid: true) {
            print("teste")
        }
}
