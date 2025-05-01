import SwiftUI

struct SubjectsView: View {
    @ObservedObject var viewModel: SubjectViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    @State private var showAlert = false
    @State private var inputText = ""
    
    var body: some View {
        List(viewModel.subjects, id: \.id) { subject in
            Text(subject.name)
                .contentShape(Rectangle())
                .onTapGesture {
                    coordinator.push(route: .subjectDetails(subject))
                }
        }
        .navigationTitle("Subjects")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                AddButtonBindingView(tapped: $showAlert)
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
