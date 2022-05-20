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
    
    func getEmployees() -> [Employee] {
        db.getEmployees().compactMap(Employee.init(entity:))
    }
    
    func saveEmployees(employees: [Employee]) {
        db.saveEmployees(employees: employees.compactMap { $0.asEntity })
    }
    
    func saveEmployee(employee: Employee) {
        db.saveEmployee(employee: employee.asEntity)
    }
    
    func updateEmployee(employee: Employee) {
        db.updateEmployee(employee: employee.asEntity)
    }
    
    func deleteEmployee(employee: Employee) {
        db.deleteEmployee(employee: employee.asEntity)
    }
    
    func updateEmployees(employees: [Employee]) {
        db.updateEmployees(employees: employees.compactMap { $0.asEntity } )
    }
}
