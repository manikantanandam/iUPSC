//
//  SubjectDetailsView.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 29/04/25.
//
import SwiftUI

struct SubjectDetailsView: View {
    @ObservedObject var viewModel: SubjectDetailsViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        VStack {
            Text("Subject Details")
                .font(.headline)
            Text("ID: \(viewModel.subject.id)")
                .padding()
            Text("Name: \(viewModel.subject.name)")
                .padding()
            Text("Created: \(viewModel.subject.created)")
                .padding()
            
            Text("Updated: \(viewModel.subject.updated)")
                .padding()

            Button("Back to Subjects") {
                coordinator.resetNavigation()
            }
            
            Button("Delete") {
                Task {
                    await viewModel.deleteSubject()
                    coordinator.resetNavigation()
                }
            }
            .padding()
        }
        .navigationTitle(viewModel.subject.name)
    }
}
