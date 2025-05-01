//
//  TopicDetailsView.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import SwiftUI

struct TopicDetailsView: View {
    
    @ObservedObject var viewModel: TopicDetailsViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    
    init(viewModel: TopicDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text(viewModel.topic.name)
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                AddButtonActionView {
                    coordinator.push(route: .addQuestion(viewModel.topic))
                }
            }
        }
    }
}
