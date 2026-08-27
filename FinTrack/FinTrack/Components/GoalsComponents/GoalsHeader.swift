//
//  GoalsHeader.swift
//  FinTrack
//
//  Created by breno.farias on 27/08/26.
//

import SwiftUI

struct GoalsHeader: View {
    let totalGoals: Int
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Financial Goals")
                .foregroundStyle(Color("Foreground"))
                .font(.title)
                .fontWeight(.bold)
            Text("\(totalGoals) active goals")
                .foregroundStyle(Color("TextMuted"))
                .font(.footnote)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.top, 20)
    }
}

#Preview {
    GoalsHeader(totalGoals: 5)
}
