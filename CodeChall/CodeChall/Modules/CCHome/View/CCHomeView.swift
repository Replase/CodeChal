//
//  CCHomeView.swift
//  CodeChall
//
//  Created by Alan Emiliano Ramirez Ayala on 26/01/25.
//

import SwiftUI

struct CCHomeView: View {
    @ObservedObject var viewModel: CCHomeViewModel = CCHomeViewModel()
    var body: some View {
        NavigationStack {
            listView
        }
        .searchable(text: $viewModel.strSearchText, prompt: "Buscar")
        .onChange(of: viewModel.strSearchText) { _, newValue in
            if !newValue.isEmpty {
                viewModel.searchData(dataName: newValue)
            } else {
                viewModel.emptyValueSearch()
            }
        }
    }
    
    private var listView: some View {
        List(viewModel.searchData, id: \.id) { crypto in
            Text(crypto.name)
        }
    }
    
    private var rowCrypto: some View {
        VStack {
            
        }
    }
}

#Preview {
    CCHomeView()
}
