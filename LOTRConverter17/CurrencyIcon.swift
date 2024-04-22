//
//  CurrencyIcon.swift
//  LOTRConverter17
//
//  Created by HUY TON on 20/4/24.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImg: ImageResource
    let currencyName: String
    
    var body: some View {
        ZStack(alignment: .bottom) {

            Image(currencyImg)
                .resizable()
                .scaledToFit()

            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
        
        
    }

}

#Preview {
    CurrencyIcon(currencyImg: .goldpenny, currencyName: "Gold Penny")
}
