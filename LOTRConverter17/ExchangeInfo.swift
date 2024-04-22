//
//  ExchangeInfo.swift
//  LOTRConverter17
//
//  Created by HUY TON on 20/4/24.
//

import SwiftUI



struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            // background
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Exchange Rate")
                    .font(.largeTitle)
                    .tracking(5) // spaces  between characters
                    .bold()
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                ExchangeRate(leftImg: .goldpiece, ratio:"1 Gold Piece  = 4 Gold Pennies", rightImg: .goldpenny)
                
                ExchangeRate(leftImg: .goldpenny, ratio:"1 Gold Penny  = 4 Silver Pieces ", rightImg: .silverpiece)
                
                ExchangeRate(leftImg: .silverpiece, ratio:"1 Silver Piece  = 4 Silver Pennies", rightImg: .silverpenny)
                
                ExchangeRate(leftImg: .silverpenny, ratio:"1 Silver Penny = 100 Copper Pennies", rightImg: .copperpenny)

                Button("Done") {
                    dismiss()
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .padding()
                .font(.largeTitle)
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}
