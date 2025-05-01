//
//  FirestoreServiceManager.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 29/04/25.
//

import FirebaseFirestore
//import FirebaseFirestoreSwift
import Foundation

class FirestoreServiceManager {
    private let db = Firestore.firestore()

    // MARK: - Create
    func create<T: DictionaryConvertible>(collection: String, documentID: String, data: T) async throws {
        let dictionary = data.toDictionary() ?? [:]
        let docRef = db.collection(collection).document(documentID)
        try await docRef.setData(dictionary)
    }

    // MARK: - Read
    func read<T: Decodable>(collection: String, documentID: String, modelType: T.Type) async throws -> T {
        let docRef = db.collection(collection).document(documentID)
        let snapshot = try await docRef.getDocument()
        let data = try snapshot.data(as: modelType)
        return data
    }
    
    // MARK: - Read Documents
    func readCollection<T: Decodable>(collection: String, modelType: T.Type) async throws -> [T] {
        let snapshot = try await db.collection(collection).getDocuments()
        return snapshot.documents.compactMap { document in
            try? document.data(as: modelType)
        }
    }

    // MARK: - Update
    func update<T: DictionaryConvertible>(collection: String, documentID: String, data: T) async throws {
        let dictionary = data.toDictionary() ?? [:]
        let docRef = db.collection(collection).document(documentID)
        
        try await docRef.updateData(dictionary)
    }

    // MARK: - Delete
    func delete(collection: String, documentID: String) async throws {
        let docRef = db.collection(collection).document(documentID)
        
        try await docRef.delete()
    }
}
