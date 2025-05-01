//
//  ContentView.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 27/04/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var coordinator: SubjectsCoordinator
    @StateObject private var viewModel: SubjectViewModel

    init() {
        let container = DependencyContainer.shared

        // Resolve coordinator and ViewModel
        let resolvedCoordinator = container.resolve(SubjectsCoordinator.self)!
        let resolvedViewModel = container.resolve(SubjectViewModel.self)!

        _coordinator = StateObject(wrappedValue: resolvedCoordinator)
        _viewModel = StateObject(wrappedValue: resolvedViewModel)
    }

    var body: some View {
        SubjectsView(viewModel: viewModel, coordinator: coordinator)
    }
}

