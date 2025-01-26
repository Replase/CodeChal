//
//  CCHomeViewModel.swift
//  CodeChall
//
//  Created by Alan Emiliano Ramirez Ayala on 26/01/25.
//

import SwiftUI

class CCHomeViewModel: ObservableObject {
    var remoteDataManager: CCHomeRemoteDataManager {
        let selfClass = CCHomeRemoteDataManager()
        selfClass.output = self
        return selfClass
    }
    private var data: [CCCryptoDatum] = []
    @Published var strSearchText: String = ""
    @Published var searchData: [CCCryptoDatum] = []
    
    init() {
        Task {
            await remoteDataManager.getData()
        }
    }
    
    
    func getCryptoData() -> CCCryptoData? {
        return data
    }
    
    func searchData(dataName: String) {
        searchData = data.filter {$0.name.lowercased().contains(dataName.lowercased())}
    }
    
    func emptyValueSearch() {
        searchData = Array(data.prefix(20))
    }
   
}

extension CCHomeViewModel: CCHomeRemoteDataManagerOutput {
    func successResponse(data: CCCryptoData) {
        self.data = data
        emptyValueSearch()
    }
    
    func errorResponse(error: any Error) {
        print("\(error)")
    }
    
    
}
