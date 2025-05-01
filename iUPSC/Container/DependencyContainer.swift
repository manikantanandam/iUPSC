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
        container.register(SubjectViewModel.self) { resolver in
            let serviceManager = resolver.resolve(SubjectServiceManager.self)!
            return SubjectViewModel(subjectServiceManager: serviceManager)
        }
        
        // Register SubjectViewModel
        container.register(SubjectDetailsViewModel.self) { resolver, subject in
            let subjectServiceManager = resolver.resolve(SubjectServiceManager.self)!
            return SubjectDetailsViewModel(subject: subject, subjectServiceManager: subjectServiceManager)
        }
        
        // Register SubjectsCoordinator
        container.register(SubjectsCoordinator.self) { resolver in
            return SubjectsCoordinator()
            
            
            // You can register other dependencies here
        }
    }

        func resolve<Service>(_ serviceType: Service.Type) -> Service? {
            return container.resolve(serviceType)
        }
}
