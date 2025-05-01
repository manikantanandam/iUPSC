import SwiftUI

struct SubjectsView: View {
    @ObservedObject var viewModel: SubjectViewModel
    @ObservedObject var coordinator: SubjectsCoordinator
    @State private var showAlert = false
    @State private var inputText = ""

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            List(viewModel.subjects, id: \.id) { subject in
                NavigationLink(value: subject) {
                    Text(subject.name)
                        .onTapGesture {
                            coordinator.navigateToSubjectDetails(subject: subject)
                        }
                }
            }
            .navigationDestination(for: Subject.self) { subject in
                let viewModel = DependencyContainer.shared.container.resolve(SubjectDetailsViewModel.self, argument: subject)!
                SubjectDetailsView(viewModel: viewModel, coordinator: coordinator)
            }
            .navigationTitle("Subjects")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        showAlert = true
                    }
                }
            }
            .onAppear {
                print("Fetching subject")
                Task {
                    await viewModel.viewAppeared()
                }
            }
            .overlay(
                CustomAlertView(isPresented: $showAlert, inputText: $inputText)
                    .opacity(showAlert ? 1 : 0)
            )
            .onChange(of: showAlert) { _, _ in
                if !showAlert {
                    if !inputText.isEmpty {
                        Task {
                            await viewModel.addSubject(name: inputText)
                            inputText = ""
                        }
                    }
                }
            }
        }
    }
}
