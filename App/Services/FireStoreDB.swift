//
//  FireStoreDB.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol EmployeeRepositoryProtocol {
    
    func getDocuments<T: Codable>(notification: @escaping ([T]) -> Void)
    
    func saveDocument<T: Codable>(document: T,
                                  at id: String,
                                  completion: @escaping (Bool) -> Void)
    
    func deleteDocument(id: String,
                        completion: @escaping ((Bool) -> Void))
    
    func updateFieldForDocuments(ids: [String],
                                 field: [String: Any],
                                 completion: @escaping (Bool) -> Void)
}

struct FireStoreDB: EmployeeRepositoryProtocol {
    
    let db = Firestore.firestore()
    let collection: CollectionReference
    
    init(collectionPath: String) {
        collection = db.collection(collectionPath)
    }
    
    func getDocuments<T: Codable>(notification: @escaping ([T]) -> Void) {
        collection.addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                notification([])
                return
            }
            notification(
                documents.compactMap { try? $0.data(as: T.self) }
            )
        }
    }
    
    func saveDocument<T: Codable>(document: T,
                                  at id: String,
                                  completion: @escaping (Bool) -> Void) {
        do {
            try collection.document(id).setData(from: document)
            completion(true)
        } catch {
            print("Error writing document: \(error)")
            completion(false)
        }
    }
    
    func deleteDocument(id: String,
                        completion: @escaping ((Bool) -> Void)) {
        collection.document(id).delete { error in
            completion(error == nil)
        }
    }
    
    func updateFieldForDocuments(ids: [String],
                                 field: [String: Any],
                                 completion: @escaping (Bool) -> Void) {
        let batch = db.batch()
        ids.forEach { id in
            let ref = collection.document(id)
            batch.updateData(field, forDocument: ref)
        }
        batch.commit { error in completion(error == nil) }
    }
}
