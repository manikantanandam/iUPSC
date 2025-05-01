//
//  Array+Extension.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import Foundation

extension Array where Element: Identifiable {
    mutating func update(element: Element) {
        if let indexToUpdate = firstIndex(where: { $0.id == element.id }) {
            self[indexToUpdate] = element
        }
    }
    
    mutating func remove(element: Element) {
        if let indexToRemove = firstIndex(where: { $0.id == element.id }) {
            self.remove(at: indexToRemove)
        }
    }
}
