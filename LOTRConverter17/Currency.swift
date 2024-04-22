//
//  Currency.swift
//  LOTRConverter17
//
//  Created by HUY TON on 20/4/24.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    
    
    // stored property
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    // computed propery
    
    var id: Currency{ self }

    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    var name: String {
        switch self {
        case .copperPenny:
                "Copper Penny"
        case .silverPenny:
                "Silver Penny"
        case .silverPiece:
                "Silver Piece"
        case .goldPenny:
                "Gold Penny"
        case .goldPiece:
                "Gold Piece"
        }
    }
    
    func convert(_ currentValue: String, to: Currency) -> String {
        guard let amount = Double(currentValue) else {
            return ""
        }
        let convertedAmount = (amount / self.rawValue) * to.rawValue
        let res = String(format: "%.2f", convertedAmount)
        return res
    }
}

