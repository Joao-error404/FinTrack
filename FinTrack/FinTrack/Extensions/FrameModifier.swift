//
//  FrameModifier.swift
//  FinTrack
//
//  Created by breno.farias on 27/08/26.
//

import SwiftUI
import Foundation

struct FrameModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, minHeight: 80, alignment: .leading)
            .background {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color("Surface"))
                    .shadow(
                        color: .black.opacity(0.1),
                        radius: 6
                    )
            }
            .overlay {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color("Border"), lineWidth: 1)
            }
    }
}

extension View {
    func frameStyle() -> some View {
        modifier(FrameModifier())
    }
}
