//
//  HomeView.swift
//  Shared
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button("add new employee") {
                        viewModel.showModal.toggle()
                    }
                    Spacer()
                }
                .padding()
                .buttonStyle(.bordered)
                .popover(isPresented: $viewModel.showModal) { NewEmployeeView(employees: $viewModel.employees)
                }
                
                List {
                    ForEach(viewModel.employees) { employee in
                        NavigationLink(
                            destination: EmployeeView(viewModel:
                                                        EmployeeViewModel(employee: employee)
                                                     )
                        ) {
                            HStack {
                                Text(employee.displayableName)
                                Spacer()
                                Text(employee.overtime.toString())
                            }
                        }
                    }
                    .onDelete(perform: viewModel.removeEmployee)
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
    
    
    
    var body: some View {
        HStack {
            Text(employee.displayableName)
            Spacer()
            Text(employee.overtime.toString())
        }
    }
}
