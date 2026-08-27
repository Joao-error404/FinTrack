//
//  GoalsProgressCard.swift
//  FinTrack
//
//  Created by breno.farias on 27/08/26.
//

import SwiftUI

struct GoalsProgressCard: View {
    var body: some View {
        VStack (alignment: .leading){
            HStack () {
                Text("Overall Progress")
                    .foregroundStyle(Color("Foreground"))

                Spacer()

                Text("39%")
                    .foregroundStyle(Color("Accent"))
            }
            .padding(.horizontal, 4)
            .fontWeight(.bold)
            .lineLimit(1)
            
            
            ProgressView(value: 0.5)
                .tint(
                    LinearGradient(
                        colors: [
                            Color("Accent"),
                            Color.purple
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .padding(.vertical, 8)
                .scaleEffect(y: 2, anchor: .center)
            
            HStack (){
                Text("$43.8k")
                
                Spacer()
                
                Text("of $100k")
            }
            .foregroundStyle(Color("TextMuted"))
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 130)
        .frameStyle()
    }
}

#Preview {
    GoalsProgressCard()
}
