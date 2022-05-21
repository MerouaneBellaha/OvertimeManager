//
//  EmployeeService.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import Foundation

struct EmployeeRepository {

    private let db: EmployeeRepositoryProtocol = FireStoreDB()
    
    private let entriesKey = "entries"
    
    func getEmployees(notification: @escaping ([Employee]) -> Void) {
        db.getEmployees { result in notification(result.map { Employee(entity: $0) }) }
    }
    
    func saveEmployee(employee: Employee,
                      completion: @escaping (Bool) -> Void) {
        db.saveEmployee(employee: employee.asEntity) { result in completion(result) }
    }
    
    func updateEmployee(id: UUID,
                        fields: [String: Any],
                        completion: @escaping (Bool) -> Void) {
        db.updateEmployee(id: id.uuidString, fields: fields) { result in completion(result) }
    }
    
    func deleteEmployee(id: UUID,
                        completion: @escaping (Bool) -> Void) {
        db.deleteEmployee(id: id.uuidString) { result in completion(result)}
    }
    
    func updateEmployees(employees: [Employee],
                         fields: [String: Any],
                         completion: @escaping (Bool) -> Void) {
        
        db.updateEmployees(employees: employees.map { $0.asEntity }, fields: fields) { result in completion(result) }
    }
}
