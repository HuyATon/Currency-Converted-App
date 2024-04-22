//
//  CurrencyTip.swift
//  LOTRConverter17
//
//  Created by HUY TON on 22/4/24.
//

import Foundation
import TipKit


struct CurrencyTip: Tip {
    
    var id = String(arc4random_uniform(6))

    var title = Text("Change Currency")
    
    var message: Text? = Text("Tap to brin up Select Currency screen")
    
}

