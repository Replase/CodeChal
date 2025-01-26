//
//  CCStringExtension.swift
//  CodeChall
//
//  Created by Alan Emiliano Ramirez Ayala on 26/01/25.
//
import Foundation

extension String {
    func formatDate() -> String? {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds] 
        if let date = isoFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateStyle = .long
            outputFormatter.timeStyle = .medium
            outputFormatter.timeZone = TimeZone.current
            return outputFormatter.string(from: date)
        }
        return nil
    }
}
