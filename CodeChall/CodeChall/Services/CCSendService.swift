//
//  CCSendService.swift
//  CodeChall
//
//  Created by Alan Emiliano Ramirez Ayala on 26/01/25.
//

import Foundation

final class CCSendService {
    
    func sendRequest<T: Decodable>(
        urlRequest: URLRequest,
        responseType: T.Type
    ) async throws -> T {
        let request = urlRequest
        print("Request: \(request.prettyPrinted())")
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Error en respuesta: \(response)")
            throw CCAPIError.responseUnsuccessful
        }
        let decoder = JSONDecoder()
        do {
            let decodedResponse = try decoder.decode(T.self, from: data)
            return decodedResponse
        } catch {
            print("Error al decodificar la respuesta: \(error)")
            throw CCAPIError.jsonConversionFailure
        }
    }
}

