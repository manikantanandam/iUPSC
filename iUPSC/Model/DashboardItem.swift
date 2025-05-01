//
//  DashboardItem.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 29/04/25.
//

import Foundation

enum DashboardItemType {
    case subjects
    case topics
}

extension DashboardItemType {
    var title: String {
        switch self {
        case .subjects:
            return "Subjects"
        case .topics:
            return "Topics"
        }
    }
}

struct DashboardItem: Identifiable {
    let id = UUID()
    let type: DashboardItemType
    var count: Int
}
