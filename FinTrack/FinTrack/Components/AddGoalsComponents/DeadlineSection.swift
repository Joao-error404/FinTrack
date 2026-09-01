//
//  DeadlineSection.swift
//  FinTrack
//
//  Created by breno.farias on 28/08/26.
//

import SwiftUI

struct DeadlineSection: View {
    @Binding var hasDeadline: Bool
    @Binding var deadline: Date
    @State private var showDatePicker = false
    
    var body: some View {
        VStack {
            Text("Deadline")
                .sectionTitleModifier()
            
            Toggle("Set deadline", isOn: $hasDeadline)
                .onChange(of: hasDeadline) { _, newValue in
                    if newValue {
                        showDatePicker = true
                    }
                }
                .foregroundStyle(Color("Foreground"))
                .tint(Color("Accent"))
            
            if hasDeadline {
                CustomDatePicker(
                    title: "Deadline",
                    selectedDate: $deadline,
                    showDatePicker: $showDatePicker)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 150)
        .frameStyle()
    }
}

#Preview {
    @Previewable @State var hasDeadline: Bool = false
    @Previewable @State var deadline: Date = Date()
    DeadlineSection(hasDeadline: $hasDeadline, deadline: $deadline)
}
