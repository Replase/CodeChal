//
//  Untitled.swift
//  CodeChall
//
//  Created by Alan Emiliano Ramirez Ayala on 26/01/25.
//
import Foundation

extension Double {
    func formatToDollar() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: NSNumber(value: self))
    }
}
