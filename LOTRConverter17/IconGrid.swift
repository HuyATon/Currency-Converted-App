//
//  IconGrid.swift
//  LOTRConverter17
//
//  Created by HUY TON on 21/4/24.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency

    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            
            ForEach(Currency.allCases) { entry in
                CurrencyIcon(currencyImg: entry.image, currencyName: entry.name)
                    
                    .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .overlay {
                        if entry == self.currency {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 5)
                                .opacity(0.7)
                        }
                        
                    }
                    .onTapGesture{
                        self.currency = entry
                    }
            }
        }

    }
}

#Preview {
    IconGrid(currency: .constant(.copperPenny))
}
