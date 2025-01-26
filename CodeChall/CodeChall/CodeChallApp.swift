//
//  CodeChallApp.swift
//  CodeChall
//
//  Created by Alan Emiliano Ramirez Ayala on 26/01/25.
//

import SwiftUI

@main
struct CodeChallApp: App {
    @ObservedObject private var loaderState = GlobalState.shared
    var body: some Scene {
        WindowGroup {
            ZStack {
                CCHomeView()
                if loaderState.isLoading {
                    loadingView
                }
            }
        }
    }
    
    private var loadingView: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            VStack {
                ProgressView()
                    .scaleEffect(1.5)
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                Text("Cargando...")
                    .foregroundStyle(.white)
                    .padding(.top, 10)
            }
        }
        .transition(.opacity)
        .animation(.easeInOut, value: loaderState.isLoading)
    }
}

class GlobalState: ObservableObject {
    static var shared: GlobalState = GlobalState()
    @Published var isLoading: Bool = false
}
