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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CCHomeView()
}
