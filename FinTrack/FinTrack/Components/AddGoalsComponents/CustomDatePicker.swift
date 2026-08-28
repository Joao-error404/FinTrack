//
//  CustomDatePicker.swift
//  FinTrack
//
//  Created by breno.farias on 28/08/26.
//

import SwiftUI

struct CustomDatePicker: View {
    let title: String
    @Binding var selectedDate: Date
    @Binding var showDatePicker: Bool

    
    var body: some View {
        Button {
            showDatePicker.toggle()
        } label: {
            HStack {
                Image(systemName: "calendar")
                    .foregroundStyle(Color("Accent"))

                Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                    .foregroundStyle(Color("Foreground"))

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 10)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .sheet(isPresented: $showDatePicker) {
            VStack {
                DatePicker(
                    "",
                    selection: $selectedDate,
                    in: Date()...,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                .tint(Color("Accent"))

                Button("Done") {
                    showDatePicker = false
                }
                .tint(Color("Accent"))
                .buttonStyle(.borderedProminent)
                
            }
            .padding()
        }

            
    }
}

#Preview {
    @Previewable @State var deadline: Date = Date()
    @Previewable @State var showDatePicker: Bool = false
    CustomDatePicker(title: "Deadline", selectedDate: $deadline, showDatePicker: $showDatePicker)
}
