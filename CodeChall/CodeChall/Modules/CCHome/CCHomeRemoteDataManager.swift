//
//  CCHomeRemoteDataManager.swift
//  CodeChall
//
//  Created by Alan Emiliano Ramirez Ayala on 26/01/25.
//
struct EmptyRequest: Encodable {}

protocol CCHomeRemoteDataManagerInput {
    func getData() async
}
@MainActor
protocol CCHomeRemoteDataManagerOutput {
    func successResponse(data: CCCryptoData)
    func errorResponse(error: Error)
}

class CCHomeRemoteDataManager: CCHomeRemoteDataManagerInput {
    private let service: CCSendService = CCSendService()
    var output: CCHomeRemoteDataManagerOutput?
    
    func getData() async {
        do {
            let data = try await service.sendRequest(urlRequest: CCPath.crypto.request, responseType: CCCryptoData.self)
            print("Respuesta del servidor: \(data)")
            await output?.successResponse(data: data)
        } catch {
            print("Error al enviar la solicitud: \(error)")
            await output?.errorResponse(error: error)
        }
        
    }
}
