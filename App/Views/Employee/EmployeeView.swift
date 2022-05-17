//
//  EmployeeView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 15/05/2022.
//

import SwiftUI

struct EmployeeView: View {
    
    @ObservedObject var viewModel: EmployeeViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("overtime: " + viewModel.employee.overtime.toString())
                    Spacer()
                }
                .padding()
                HStack {
                    Button("add new entry") {
                        viewModel.showModal.toggle()
                    }
                    Spacer()
                }
                .padding()
                .buttonStyle(.bordered)
                .popover(isPresented: $viewModel.showModal) {
                    NewEntryView(viewModel: NewEntryViewModel(employee: viewModel.employee))
                }
                List {
                    ForEach(viewModel.employee.entries) { entry in
                        HStack {
                            Text(entry.displayableDate)
                                .padding(.trailing)
                            Text(entry.service.description)
                            Spacer()
                            Text(entry.overtime.toString())
                        }
                    }
                    .onDelete(perform: viewModel.removeEntry)
                }
            }
            .navigationTitle(viewModel.employee.displayableName)
        }
    }
}

struct EmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeView(viewModel: EmployeeViewModel(employee: EmployeeFactory.employee))
    }
}
