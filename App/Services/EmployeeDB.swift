//
//  EmployeeDB.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct FireStoreDB {
    
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
                print("listener")
                notification(
                    documents.compactMap { try? $0.data(as: EmployeeModel.self) }
                )
            }
    }
    
    
//    func saveEmployees(employees: [EmployeeModel]) {
//
//    }
    
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
    
    func updateEmployee(employee: EmployeeModel) {
        
    }
    
    func updateEmployees(employees: [EmployeeModel],
                         completion: @escaping ((Bool) -> Void)) {
        //TODO: - pass fields+values to update as parameters
        let batch = db.batch()
        employees.forEach { employee in
            let docRef = db.collection("employees").document(employee.id.uuidString)
            
            batch.updateData(["overtime": employee.overtime], forDocument: docRef)
        }
        batch.commit { error in completion(error == nil) }
    }
    
    func deleteEmployee(employee: EmployeeModel,
                        completion: @escaping ((Bool) -> Void)) {
        db.collection("employees").document(employee.id.uuidString).delete { error in
            completion(error == nil)
        }
    }
}

struct EmployeeDB: EmployeeRepositoryProtocol {
    
    private let defaults: UserDefaults
    private let employeesKey = "employees"
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.defaults = userDefaults
    }
    
    func getEmployees() -> [EmployeeModel] {
        if let data = defaults.data(forKey: employeesKey) {
            do {
                let decoder = JSONDecoder()
                let employees = try decoder.decode([EmployeeModel].self, from: data)
                return employees
            } catch {
                print("unable to decode (\(error))")
                return []
            }
        }
        return []
    }
    
    func saveEmployees(employees: [EmployeeModel]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(employees)
            defaults.set(data, forKey: employeesKey)
        } catch {
            print("unable to encode (\(error))")
        }
    }
    
    func saveEmployee(employee: EmployeeModel) {
        var savedEmployees = getEmployees()
        savedEmployees.append(employee)
        saveEmployees(employees: savedEmployees)
    }
    
    
    func updateEmployee(employee: EmployeeModel) {
        var employees = getEmployees()
        guard let indexToUpdate = employees.firstIndex(where: { ($0.id == employee.id) }) else {
            print("updateEmployee: can't find employee")
            return
        }
        employees[indexToUpdate] = employee
        saveEmployees(employees: employees)
    }
    
    func updateEmployees(employees: [EmployeeModel]) {
        saveEmployees(employees: employees)
    }
    
    func deleteEmployee(employee: EmployeeModel) {
        var employees = getEmployees()
        guard let indexToUpdate = employees.firstIndex(where: { $0.id == employee.id }) else {
            print("can't find employee")
            return
        }
        employees.remove(at: indexToUpdate)
        saveEmployees(employees: employees)
    }
}
