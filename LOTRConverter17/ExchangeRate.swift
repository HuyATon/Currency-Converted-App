//
//  ExchangeRate.swift
//  LOTRConverter17
//
//  Created by HUY TON on 20/4/24.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImg: ImageResource
    let ratio: String
    let rightImg: ImageResource
    
    var body: some View {
        HStack {
            Image(leftImg)
                .resizable()
                .scaledToFit()
                .frame(height:33)
            Text(ratio)
            
            Image(rightImg)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
    
}

#Preview {
    ExchangeRate(leftImg: .goldpiece, ratio:"1 Gold Piece  = 4 Gold Pennies", rightImg: .goldpenny)
}
