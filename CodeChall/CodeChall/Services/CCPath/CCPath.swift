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

extension CCPath: LHEndpoint {
    
    var base: String {
        "https://api.coingecko.com"
    }
    
    var path: String {
        switch self {
        case .crypto:
            "/api/v3/coins/markets"
        }
    }
    
    var method: String {
        switch self {
        case .crypto:
            "GET"
        }
    }
}
