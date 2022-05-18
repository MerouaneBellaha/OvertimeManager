//
//  HomeView.swift
//  Shared
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @StateObject var employeeStore: EmployeeStore = EmployeeStore()
    
    var body: some View {
        NavigationView {
            VStack {
                HStackTwoButtonsView(
                    left: .init(title: "add new employee") { viewModel.showModal.toggle() },
                    right: .init(title: "reset", action:  employeeStore.resetOvertimeToZeroForAllEmployees)
                )
                .padding()
                .popover(isPresented: $viewModel.showModal) { NewEmployeeView(employeeStore: employeeStore)
                }
                
                List {
                    ForEach($employeeStore.employees) { $employee in
                        NavigationLink(
                            destination: EmployeeView(employee: employee)
                                .navigationTitle(employee.displayableName)
                        ) {
                            EmployeeRowView(employee: $employee)
                        }
                        .onAppear {
                            employeeStore.objectWillChange.send()
                        }
                    }
                    .onDelete(perform: employeeStore.removeEmployee)
                }
            }
            .navigationTitle("Employees")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}

struct EmployeeRowView: View {
    
    @Binding var employee: Employee
    
    var body: some View {
        HStack {
            Text(employee.displayableName)
            Spacer()
            Text(employee.overtime.toString())
        }
    }
}
