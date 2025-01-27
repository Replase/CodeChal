//
//  CCDetail.swift
//  CodeChall
//
//  Created by Alan Emiliano Ramirez Ayala on 26/01/25.
//

import SwiftUI

struct CCDetail: View {
    @ObservedObject var viewModel: CCDetailViewModel
    
    init(cryptoData: CCCryptoDatum) {
        self.viewModel = CCDetailViewModel(detailCrypto: cryptoData)
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    Text(viewModel.detailCrypto.name)
                        .bold()
                        .font(.title)
                    if let url = URL(string: viewModel.detailCrypto.image) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            case .failure:
                                Image(systemName: "photo")
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                    Text("\(viewModel.detailCrypto.totalVolume)")
                    Text(viewModel.detailCrypto.high24H.formatToDollar() ?? "")
                    Text(viewModel.detailCrypto.low24H.formatToDollar() ?? "")
                    Text(viewModel.detailCrypto.priceChange24H.formatToDollar() ?? "")
                    Text("\(viewModel.detailCrypto.marketCap)")
                }
            }
            .navigationTitle("Detail")
        }
    }
}

#Preview {
    CCDetail(cryptoData: CCCryptoDatum(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 102465.0, marketCap: 2031277776946, marketCapRank: 1, fullyDilutedValuation: 2031277776946, totalVolume: 20108569818, high24H: 105376.0, low24H: 102552.0, priceChange24H: -2334.271271162608, priceChangePercentage24H: -2.22738, marketCapChange24H: -43228277593.63989, marketCapChangePercentage24H: -2.08379, circulatingSupply: 19815500.0, totalSupply: 19815500.0, maxSupply: Optional(21000000.0), ath: 108786.0, athChangePercentage: -5.64822, athDate: "2025-01-20T09:11:54.494Z", atl: 67.81, atlChangePercentage: 151267.94052, atlDate: "2013-07-06T00:00:00.000Z", roi: nil, lastUpdated: "2025-01-27T00:02:48.343Z"))
}
