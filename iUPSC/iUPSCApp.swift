//
//  iUPSCApp.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 27/04/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct iUPSCApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let authService = AuthService()

  var body: some Scene {
      WindowGroup {
          ContentView()
              .onAppear {
                  Task {
                      await authService.signInAnonymously()
                  }
              }
      }
  }
}
