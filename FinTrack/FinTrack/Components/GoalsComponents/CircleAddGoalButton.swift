//
//  AddGoalButton.swift
//  FinTrack
//
//  Created by breno.farias on 31/08/26.
//

import SwiftUI

struct CircleAddGoalButton: View {
    @Binding var showingAddGoal: Bool
    
    var body: some View {
        Button {
            showingAddGoal = true
        } label: {
            Image(systemName: "plus")
                        .font(.body)
                        .foregroundStyle(Color("PrimaryForeground"))
                        .frame(width: 46, height: 46)
                        .background(Color("Primary"))
                        .clipShape(Circle())
        }
        .padding()
    }
}
