//
//  HomeView.swift
//  Shared
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var db = FireStoreDB()
    
    var body: some View {
        NavigationView {
            VStack {
                HStackTwoButtonsView(
                    left: .init(title: "add new employee") { viewModel.showModal.toggle() },
                    right: .init(title: "reset", action:
                                    viewModel.didTapResetOvertime)
                )
                .padding()
                .popover(isPresented: $viewModel.showModal) {
                    NewEmployeeView(viewModel:NewEmployeeViewModel(employeeStore: viewModel.employeeStore))
                }
                
                List {
                    ForEach($viewModel.employeeStore.employees) { $employee in
                        
                        
                        NavigationLink(
                            destination: EmployeeView(viewModel: EmployeeViewModel(employee: employee))
                                .navigationTitle(employee.displayableName)
                        ) {
                            EmployeeRowView(employee: $employee)
                        }
                    }
                    .onDelete(perform: viewModel.didSwapToDeleteEmployee)
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
