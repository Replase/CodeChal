//
//  CCPath.swift
//  CodeChall
//
//  Created by Alan Emiliano Ramirez Ayala on 26/01/25.
//

import Foundation

enum CCPath {
    case crypto
}

extension CCPath {
    var path: String {
        switch self {
        case .crypto:
            "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
        }
    }
    
    var method: String {
        switch self {
        case .crypto:
            "GET"
        }
    }
}
