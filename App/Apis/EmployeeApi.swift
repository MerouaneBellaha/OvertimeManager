//
//  EmployeeApi.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import Foundation

protocol EmployeeApi {
    func getEmployees() -> [EmployeeEntity]
    func saveEmployees(employees: [EmployeeEntity])
    func saveEmployee(employee: EmployeeEntity)
    func updateEmployee(employee: EmployeeEntity)
    func updateEmployees(employees: [EmployeeEntity])
    func deleteEmployee(employee: EmployeeEntity)
}

struct UserDefaultApi: EmployeeApi {
    
    private let defaults: UserDefaults
    private let employeesKey = "employees"
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.defaults = userDefaults
    }
    
    func getEmployees() -> [EmployeeEntity] {
        if let data = defaults.data(forKey: employeesKey) {
            do {
                let decoder = JSONDecoder()
                let employees = try decoder.decode([EmployeeEntity].self, from: data)
                return employees
            } catch {
                print("unable to decode (\(error))")
                return []
            }
        }
        return []
    }
    
    func saveEmployees(employees: [EmployeeEntity]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(employees)
            defaults.set(data, forKey: employeesKey)
        } catch {
            print("unable to encode (\(error))")
        }
    }
    
    func saveEmployee(employee: EmployeeEntity) {
        var savedEmployees = getEmployees()
        savedEmployees.append(employee)
        saveEmployees(employees: savedEmployees)
    }
    
    
    func updateEmployee(employee: EmployeeEntity) {
        var employees = getEmployees()
        guard let indexToUpdate = employees.firstIndex(where: { ($0.id == employee.id) }) else {
            print("can't find employee")
            return
        }
        employees[indexToUpdate] = employee
        saveEmployees(employees: employees)
    }
    
    func updateEmployees(employees: [EmployeeEntity]) {
        saveEmployees(employees: employees)
    }
    
    func deleteEmployee(employee: EmployeeEntity) {
        var employees = getEmployees()
        guard let indexToUpdate = employees.firstIndex(where: { $0.id == employee.id }) else {
            print("can't find employee")
            return
        }
        employees.remove(at: indexToUpdate)
        saveEmployees(employees: employees)
    }
}
