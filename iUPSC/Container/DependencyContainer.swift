//
//  DependencyContainer.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 29/04/25.
//

import Swinject
import SwiftUI

class DependencyContainer {
    static let shared = DependencyContainer()

    let container: Container

    private init() {
        container = Container()
        
        // Register FirestoreServiceManager
        container.register(FirestoreServiceManager.self) { _ in
            FirestoreServiceManager()
        }
        
        // Register SubjectViewModel
        container.register(SubjectServiceManager.self) { resolver in
            let serviceManager = resolver.resolve(FirestoreServiceManager.self)!
            return SubjectServiceManager(serviceManager: serviceManager)
        }
        
        // Register SubjectViewModel
        container.register(TopicsServiceManager.self) { resolver in
            let serviceManager = resolver.resolve(FirestoreServiceManager.self)!
            return TopicsServiceManager(serviceManager: serviceManager)
        }
        
        // Register SubjectViewModel
        container.register(SubTopicsServiceManager.self) { resolver in
            let serviceManager = resolver.resolve(FirestoreServiceManager.self)!
            return SubTopicsServiceManager(serviceManager: serviceManager)
        }

        // Register SubjectViewModel
        container.register(SubjectViewModel.self) { resolver in
            let serviceManager = resolver.resolve(SubjectServiceManager.self)!
            return SubjectViewModel(subjectServiceManager: serviceManager)
        }
        
        // Register SubjectViewModel
        container.register(DashboardViewModel.self) { resolver in
            return DashboardViewModel(
                subjectServiceManager: resolver.resolve(SubjectServiceManager.self)!,
                topicsServiceManager: resolver.resolve(TopicsServiceManager.self)!
            )
        }
        
        // Register SubjectViewModel
        container.register(SubjectDetailsViewModel.self) { resolver, subject in
            let subjectServiceManager = resolver.resolve(SubjectServiceManager.self)!
            return SubjectDetailsViewModel(subject: subject, subjectServiceManager: subjectServiceManager)
        }
        
        // Register SubjectViewModel
        container.register(TopicsViewModel.self) { resolver in
            let topicsServiceManager = resolver.resolve(TopicsServiceManager.self)!
            return TopicsViewModel(topicsServiceManager: topicsServiceManager)
        }
    }

        func resolve<Service>(_ serviceType: Service.Type) -> Service? {
            return container.resolve(serviceType)
        }
    
    func resolve<Service, Arg1>(_ serviceType: Service.Type, argument: Arg1) -> Service? {
        return container.resolve(serviceType, argument: argument)
    }
}
