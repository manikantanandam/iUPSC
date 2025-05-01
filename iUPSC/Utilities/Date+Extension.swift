//
//  Date+Extension.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import Foundation

extension TimeInterval {
    var convertToDate: Date {
        return Date(timeIntervalSince1970: self)
    }
}

extension TimeInterval {
    var formattedDate: String {
        // Set up a DateFormatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = .dateFormat // Customize the format as needed
        
        // Convert the Date object to a formatted string
        return dateFormatter.string(from: self.convertToDate)
    }
}
