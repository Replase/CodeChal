//
//  CCDetailViewModel.swift
//  CodeChall
//
//  Created by Alan Emiliano Ramirez Ayala on 26/01/25.
//

import SwiftUI
@MainActor
class CCDetailViewModel: ObservableObject {
    @Published var detailCrypto: CCCryptoDatum
    
    init(detailCrypto: CCCryptoDatum) {
        self.detailCrypto = detailCrypto
    }
}
