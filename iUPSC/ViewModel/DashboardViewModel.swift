//
//  DashboardViewModel.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 29/04/25.
//

import Foundation

class DashboardViewModel: ObservableObject {
    @Published var items: [DashboardItem] = []
    
    init(items: [DashboardItem]) {
        self.items = items
    }
}
