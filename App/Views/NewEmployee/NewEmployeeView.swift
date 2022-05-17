//
//  NewEmployeeView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import SwiftUI

struct NewEmployeeView: View {

    @ObservedObject var viewModel = NewEmployeeViewModel()
    @State var employeeStore: EmployeeStore
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Text("Lastname: ")
                        TextField("lastname", text: $viewModel.lastName)
                    }
                    HStack {
                        Text("Firstname: ")
                        TextField("firstname", text: $viewModel.firstName)
                    }
                    HStack {
                        Text("Overtime: " + viewModel.overtime.toString())
                        Stepper("",
                                onIncrement: { viewModel.overtime += 0.25 },
                                onDecrement: { viewModel.overtime -= 0.25 }
                        )
                    }
                }
                
                HStack {
                    Spacer()
                    Button("add") {
                        viewModel.showPopup.toggle()
                    }
                    .buttonStyle(.bordered)
                    .actionSheet(isPresented: $viewModel.showPopup) {
                        ActionSheet(title: Text("Confirm"),
                                    message: Text( viewModel.getPopupValidationMessage()),
                                    buttons: [
                                        .cancel(Text("No")),
                                        .default(Text("Yes")) {
                                            let newEmployee = viewModel.createEmployee()
                                            employeeStore.insert(newEmployee)
                                            dismiss()
                                        }
                                    ])
                    }
                    Spacer()
                    Button("dismiss") {
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                    Spacer()
                }
            }
        }
    }
}

struct NewEmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        NewEmployeeView(employeeStore: EmployeeStore())
    }
}
