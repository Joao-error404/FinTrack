//
//  TransactionDateInput.swift
//  FinTrack
//
//  Created by breno.farias on 31/08/26.
//

import SwiftUI

struct TransactionDateInput: View {
    @Binding var date: Date
    @State private var isDatePickerPresented = false

    var body: some View {
        Button {
            isDatePickerPresented = true
        } label: {
            HStack(spacing: 12) {
                Text(date.formatted(.dateTime.day().month().year()))
                    .font(.title3)
                    .foregroundStyle(Color("TextSecondary"))

                Spacer()

                Image(systemName: "calendar")
                    .font(.title3)
                    .foregroundStyle(Color("Foreground"))
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color("SurfaceSecondary"))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay {
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color("Border"), lineWidth: 1)
            }
        }
        .sheet(isPresented: $isDatePickerPresented) {
            DatePickerSheet(date: $date, isPresented: $isDatePickerPresented)
        }
    }
}

#Preview {
    @Previewable @State var date: Date = .now
    TransactionDateInput(date: $date)
}
