//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by HUY TON on 20/4/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    
    
    var body: some View {
        ZStack{
            // parment background
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                Text("Select the currency you are staring with:")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                IconGrid(currency: $topCurrency)
        
                Text("Select the currency you would like to to convert to:")
                    .fontWeight(.bold)
                IconGrid(currency: $bottomCurrency)

                
                                
                Button("Done") {
                    dismiss()
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .padding()
                .font(.largeTitle)
                .foregroundStyle(.white)
            }
            .padding()
            
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(topCurrency: .constant(.silverPenny), bottomCurrency: .constant(.silverPiece))
}
