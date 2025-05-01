//
//  DictionaryConvertible.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 29/04/25.
//

import Foundation

protocol DictionaryConvertible: Encodable {
    func toDictionary() -> [String: Any]?
}

extension DictionaryConvertible {
    func toDictionary() -> [String: Any]? {
        do {
            let jsonData = try JSONEncoder().encode(self)
            let dictionary = try JSONSerialization.jsonObject(with: jsonData, options: .fragmentsAllowed) as? [String: Any]
            return dictionary
        } catch {
            print("Error converting object to dictionary: \(error.localizedDescription)")
            return nil
        }
    }
}
