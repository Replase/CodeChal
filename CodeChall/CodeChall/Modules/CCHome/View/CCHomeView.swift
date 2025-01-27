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
                .navigationTitle("Home")
        }
        .searchable(text: $viewModel.strSearchText, prompt: "Search")
        .onChange(of: viewModel.strSearchText) { _, newValue in
            if !newValue.isEmpty {
                viewModel.searchData(dataName: newValue)
            } else {
                viewModel.emptyValueSearch()
            }
        }
        .onAppear {
            Task {
                await viewModel.remoteDataManager.getData()
            }
        }
    }
    
    private var listView: some View {
        List(viewModel.searchData, id: \.id) { crypto in
            NavigationLink {
                
            } label: {
                rowCrypto(cryp: crypto)
            }
        }
        .refreshable {
            Task {
                await viewModel.remoteDataManager.getData()
            }
        }
    }
    
    private func rowCrypto(cryp: CCCryptoDatum) -> some View {
        HStack {
            if let url = URL(string: cryp.image) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                    case .failure:
                        Image(systemName: "photo")
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            VStack(alignment: .leading) {
                Text(cryp.name)
                    .bold()
                    .font(.headline)
                Text(cryp.symbol)
                Text(cryp.currentPrice.formatToDollar() ?? "")
                Text(cryp.lastUpdated.formatDate() ?? "")
            }
        }
    }
}

#Preview {
    CCHomeView()
}
