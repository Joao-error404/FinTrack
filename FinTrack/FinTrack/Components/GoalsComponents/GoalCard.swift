//
//  GoalCard.swift
//  FinTrack
//
//  Created by breno.farias on 27/08/26.
//

import SwiftUI

struct GoalCard: View {
    let color: Color
    let colorDarker: Color
    
    var body: some View {
        HStack (spacing: 40){
            
            Image(systemName: "shield")
                .font(.system(size: 30))
                .foregroundStyle(color)
            
            VStack {
                VStack (alignment: .leading) {
                    HStack {
                        Text("Emergency Fund")
                            .foregroundStyle(Color("Foreground"))
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("39%")
                            .foregroundStyle(color)
                            .fontWeight(.bold)
                    }
                    Text("Deadline: Dec 2026")
                        .foregroundStyle(Color("TextMuted"))
                    
                }
                
                ProgressView(value: 0.5)
                    .tint(
                        LinearGradient(
                            colors: [
                                color,
                                colorDarker
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .padding(.vertical, 8)
                    .scaleEffect(y: 2, anchor: .center)
                
                VStack (alignment: .leading){
                    HStack (){
                        Text("$43.8k")
                        
                        Spacer()
                        
                        Text("/ $100k")
                    }
                    .foregroundStyle(Color("TextMuted"))
                    
                    HStack {
                        Text("Remaining")
                            .foregroundStyle(Color("TextMuted"))
                        Text("$56,2k")
                            .foregroundStyle(Color("Foreground"))
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 170)
        .frameStyle()
    }
}

#Preview {
    GoalCard(color: Color("Accent"), colorDarker: Color.purple)
}
