//
//  AuthService.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 27/04/25.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    func signInAnonymously() async {
        Auth.auth().signInAnonymously { (authResult, error) in
            if let error = error {
                print("Anonymous sign-in failed: \(error.localizedDescription)")
                // Handle the error appropriately in your UI
                return
            }

            if let user = authResult?.user {
                print("Anonymous user signed in with UID: \(user.uid)")
                // Proceed with your app logic for the signed-in anonymous user
                // For example, you might want to fetch some data or navigate to the main screen.
            }
        }
    }
}
