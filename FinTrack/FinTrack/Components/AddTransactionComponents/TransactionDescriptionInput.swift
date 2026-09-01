//
//  TransactionDescriptionInput.swift
//  FinTrack
//
//  Created by breno.farias on 01/09/26.
//

import SwiftUI

struct TransactionDescriptionInput: View {
    @Binding var description: String
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        TextField("",
                  text: $description,
        prompt: Text("Description...")
            .foregroundStyle(Color("TextMuted")))
            .padding()
            .frame(height: 50)
            .font(.body)
            .fontWeight(.semibold)
            .foregroundStyle(Color("TextSecondary"))
            .background(Color("SurfaceSecondary"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("Border"), lineWidth: 1)
            }
            .focused($isFocused)
    }
}

#Preview {
    @Previewable @State var description = ""
    @Previewable @FocusState var isFocused: Bool
    TransactionDescriptionInput(description: $description, isFocused: $isFocused)
}
