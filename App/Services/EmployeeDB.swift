//
//  EmployeeDB.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol EmployeeRepositoryProtocol {
    func getEmployees(notification: @escaping ([EmployeeModel]) -> Void)
    
    func saveEmployee(employee: EmployeeModel,
                      completion: @escaping (Bool) -> Void)
    
    func updateEmployee(id: String,
                        fields: [String: Any],
                        completion: @escaping ((Bool) -> Void))
    
    func updateEmployees(employees: [EmployeeModel],
                         fields: [String: Any],
                         completion: @escaping ((Bool) -> Void))
    
    func deleteEmployee(id: String,
                        completion: @escaping ((Bool) -> Void))
}

struct FireStoreDB: EmployeeRepositoryProtocol {
    
    let db = Firestore.firestore()
    
    func getEmployees(notification: @escaping ([EmployeeModel]) -> Void) {
        db
            .collection("employees")
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("no docs")
                    notification([])
                    return
                }
                notification(
                    documents.compactMap { try? $0.data(as: EmployeeModel.self) }
                )
            }
    }
    
    func saveEmployee(employee: EmployeeModel,
                      completion: @escaping (Bool) -> Void) {
        do {
            try db.collection("employees").document(employee.id.uuidString).setData(from: employee)
            completion(true)
        } catch {
            print("Error writing document: \(error)")
            completion(false)
        }
    }
    
    func updateEmployee(id: String,
                        fields: [String: Any],
                        completion: @escaping ((Bool) -> Void)) {
        
        db.collection("employees").document(id).updateData(fields) { error in
            completion(error == nil)
        }
    }
    
    func updateEmployees(employees: [EmployeeModel],
                         fields: [String: Any],
                         completion: @escaping ((Bool) -> Void)) {
        let batch = db.batch()
        employees.forEach { employee in
            let docRef = db.collection("employees").document(employee.id.uuidString)
            
            batch.updateData(fields, forDocument: docRef)
        }
        batch.commit { error in completion(error == nil) }
    }
    
    func deleteEmployee(id: String,
                        completion: @escaping ((Bool) -> Void)) {
        db.collection("employees").document(id).delete { error in
            completion(error == nil)
        }
    }
}
