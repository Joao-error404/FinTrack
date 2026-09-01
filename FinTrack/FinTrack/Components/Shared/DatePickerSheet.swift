//
//  DatePickerSheet.swift
//  FinTrack
//
//  Created by breno.farias on 31/08/26.
//

import SwiftUI

struct DatePickerSheet: View {
    @Binding var date: Date
    @Binding var isPresented: Bool
    var dateRange: PartialRangeFrom<Date>? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker(
                    "",
                    selection: $date,
                    in: dateRange ?? Date.distantPast...,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                .tint(Color("Primary"))
                .padding()
                
                Spacer()
                
                Button {
                    isPresented = false
                } label: {
                    Text("Done")
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                }
                .background(Color("Accent"))
                .foregroundStyle(Color("Foreground"))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .contentShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .presentationDetents([.height(430)])
    }
}

#Preview {
    @Previewable @State var date: Date = .now
    @Previewable @State var isPresented = false
    DatePickerSheet(date: $date, isPresented: $isPresented)
}
