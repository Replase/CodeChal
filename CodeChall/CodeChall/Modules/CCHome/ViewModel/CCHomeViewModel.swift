//
//  CCHomeViewModel.swift
//  CodeChall
//
//  Created by Alan Emiliano Ramirez Ayala on 26/01/25.
//

import SwiftUI

class CCHomeViewModel: ObservableObject {
    private var remoteDataManager: CCHomeRemoteDataManager {
        let selfClass = CCHomeRemoteDataManager()
        selfClass.output = self
        return selfClass
    }
    private var data: CCCryptoData?
    
    init() {
        Task {
            await remoteDataManager.getData()
        }
    }
   
}

extension CCHomeViewModel: CCHomeRemoteDataManagerOutput {
    func successResponse(data: CCCryptoData) {
        self.data = data
    }
    
    func errorResponse(error: any Error) {
        print("\(error)")
    }
    
    
}
