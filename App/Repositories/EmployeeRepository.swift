//
//  EmployeeService.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import Foundation

protocol EmployeeRepositoryProtocol {
    func getEmployees() -> [EmployeeModel]
    func saveEmployees(employees: [EmployeeModel])
    func saveEmployee(employee: EmployeeModel)
    func updateEmployee(employee: EmployeeModel)
    func updateEmployees(employees: [EmployeeModel])
    func deleteEmployee(employee: EmployeeModel)
}

struct EmployeeRepository {
    
    let db: EmployeeRepositoryProtocol = EmployeeDB()
    
    let firebase: FireStoreDB = FireStoreDB()
    
    func getEmployees(notification: @escaping ([Employee]) -> Void) {
        firebase.getEmployees { result in notification(result.compactMap { Employee(entity: $0) }) }
    }
    
    func saveEmployees(employees: [Employee]) {
        db.saveEmployees(employees: employees.compactMap { $0.asEntity })
    }
    
    func saveEmployee(employee: Employee,
                      completion: @escaping (Bool) -> Void) {
        firebase.saveEmployee(employee: employee.asEntity) { result in completion(result) }
    }
    
    func updateEmployee(employee: Employee) {
        db.updateEmployee(employee: employee.asEntity)
    }
    
    func deleteEmployee(employee: Employee,
                        completion: @escaping (Bool) -> Void) {
        firebase.deleteEmployee(employee: employee.asEntity) { result in completion(result)}
    }
    
    func updateEmployees(employees: [Employee],
                         completion: @escaping (Bool) -> Void) {
        
        firebase.updateEmployees(employees: employees.compactMap { $0.asEntity }) { result in completion(result) }

//        db.updateEmployees(employees: employees.compactMap { $0.asEntity } )
    }
}
