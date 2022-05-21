//
//  EmployeeService.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import Foundation

enum EmployeeFields {
    case overtimeToZero
    
    var value: [String: Any] {
        switch self {
        case .overtimeToZero: return ["overtime": 0]
        }
    }
}

struct EmployeeRepository {
    
    private let db: EmployeeRepositoryProtocol = FireStoreDB(collectionPath: "employees")
    
    func getEmployees(notification: @escaping ([Employee]) -> Void) {
        db.getDocuments { result in notification(result.map { Employee(entity: $0) }) }
    }
    
    func saveEmployee(employee: Employee,
                      completion: @escaping (Bool) -> Void) {
        db.saveDocument(document: employee.model, at: employee.id.uuidString ) { result in completion(result) }
    }
    
    func deleteEmployee(id: UUID,
                        completion: @escaping (Bool) -> Void) {
        db.deleteDocument(id: id.uuidString) { result in completion(result)}
    }
    
    func updateFieldForEmployees(ids: [UUID],
                                 field: EmployeeFields,
                                 completion: @escaping (Bool) -> Void) {
        
        db.updateFieldForDocuments(ids: ids.map { $0.uuidString }, field: field.value) { result in completion(result) }
    }
}
