//
//  CCExtensions.swift
//  CodeChall
//
//  Created by Alan Emiliano Ramirez Ayala on 26/01/25.
//

import Foundation

extension URLRequest {
    func prettyPrinted() -> String {
        var result = "\n---------------------------\n"
        if let url = self.url {
            result += "URL: \(url.absoluteString)\n"
        }
        if let method = self.httpMethod {
            result += "Method: \(method)\n"
        }
        if let headers = self.allHTTPHeaderFields {
            result += "Headers:\n"
            for (key, value) in headers {
                result += "\(key): \(value)\n"
            }
        }
        if let body = self.httpBody, let bodyString = String(data: body, encoding: .utf8) {
            result += "Body:\n\(bodyString)\n"
        }
        result += "---------------------------\n"
        return result
    }
}
