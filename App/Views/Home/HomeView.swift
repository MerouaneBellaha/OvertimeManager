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
        VStack {
            Button("add new employee") {
                viewModel.addEmployee(EmployeeFactory.employee)
            }
            .buttonStyle(.bordered)
            List(viewModel.employees) { employee in
                HStack {
                    Text(employee.displayableName)
                    Spacer()
                    Text(employee.overtime.toString())
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
