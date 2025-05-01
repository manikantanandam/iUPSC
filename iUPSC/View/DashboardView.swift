//
//  DashboardView.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 29/04/25.
//

import SwiftUI

struct DashboardCardView: View {
    let item: DashboardItem

    var body: some View {
        VStack {
            Text("\(item.count)")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.bottom, 4)

            Text("\(item.type.title)")
                .font(.subheadline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 100)
        .background(Color.blue)
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 5)
    }
}


struct DashboardView: View {
    @ObservedObject private var viewModel: DashboardViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.items) { item in
                    DashboardCardView(item: item)
                        .onTapGesture {
                            switch item.type {
                            case .subjects:
                                coordinator.push(route: .subjects)
                            case .topics:
                                coordinator.push(route: .topics)
                            }
                        }
                }
            }
            .padding(.horizontal)
            .navigationTitle("Dashboard")
            .navigationBarBackButtonHidden()
            .onAppear {
                Task {
                    await viewModel.viewAppeared()
                }
            }
        }
    }
}
