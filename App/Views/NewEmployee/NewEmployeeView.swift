//
//  NewEmployeeView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import SwiftUI

struct NewEmployeeView: View {
    
    @Binding var employees: [Employee]
    @ObservedObject var viewModel = NewEmployeeViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Text("Nom: ")
                        TextField("nom", text: $viewModel.firstName)
                    }
                    HStack {
                        Text("Prenom: ")
                        TextField("prenom", text: $viewModel.lastName)
                    }
                    HStack {
                        Text("Heures: " + viewModel.overtime.toString())
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
                        ActionSheet(title: Text("Confirmer"),
                                    message:Text( viewModel.getPopupValidationMessage()),
                                    buttons: [
                                        .cancel(Text("Non")),
                                        .default(Text("Oui")) {
                                            employees.append(viewModel.createEmployee())
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
        NewEmployeeView(employees: .constant(EmployeeFactory.employees))
    }
}
