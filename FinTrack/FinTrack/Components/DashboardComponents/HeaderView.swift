//
//  HeaderView.swift
//  FinTrack
//
//  Created by j.de.oliveira.neto on 21/08/26.
//
import SwiftUI

struct HeaderView: View {
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading, spacing: 0){
                Text(Date.currentMonthName)
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                Text("Bom dia, Breno")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Button{
                
            } label: {
                Image(systemName: "Bell")
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding()
                    .background(
                        Circle()
                        
                            .fill(Color.white.opacity(0.05))
                    )
                    
            }
            
        }
        
    }
}
