import SwiftUI

struct TopicsView: View {
    @ObservedObject var viewModel: TopicsViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    @State private var showAlert = false
    @State private var inputText = ""

    var body: some View {
        List(viewModel.topics, id: \.self) { topic in
            Text(topic.name)
                .onTapGesture {
                    coordinator.push(route: .topicDetails(topic))
                }
        }
        .navigationTitle("Topics")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showAlert = true
                } label: {
                    Image(systemName: "plus")
                }

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
                        await viewModel.addTopic(name: inputText)
                        inputText = ""
                    }
                }
            }
        }
        
    }
}
