//
//  EmployeeStore.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 17/05/2022.
//

import Foundation
import Combine

class EmployeeStore: ObservableObject {
    @Published var employees: [Employee] = []
}
