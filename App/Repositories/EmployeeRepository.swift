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
    
    let api: EmployeeRepositoryProtocol = EmployeeDB()
    
    func getEmployees() -> [Employee] {
        api.getEmployees().compactMap(Employee.init(entity:))
    }
    
    func saveEmployees(employees: [Employee]) {
        api.saveEmployees(employees: employees.compactMap { $0.asEntity })
    }
    
    func saveEmployee(employee: Employee) {
        api.saveEmployee(employee: employee.asEntity)
    }
    
    func updateEmployee(employee: Employee) {
        api.updateEmployee(employee: employee.asEntity)
    }
    
    func deleteEmployee(employee: Employee) {
        api.deleteEmployee(employee: employee.asEntity)
    }
    
    func updateEmployees(employees: [Employee]) {
        api.updateEmployees(employees: employees.compactMap { $0.asEntity } )
    }
}
