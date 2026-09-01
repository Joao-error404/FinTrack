//
//  AddGoalButton.swift
//  FinTrack
//
//  Created by breno.farias on 31/08/26.
//

import SwiftUI

struct CircleAddButton: View {
    @Binding var showingTab: Bool
    
    var body: some View {
        Button {
            showingTab = true
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
