//
//  NewEntryView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 16/05/2022.
//

import SwiftUI

struct NewEntryView: View {
    
    @ObservedObject var viewModel = NewEntryViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section("Set a new time entry") {
                HStack {
                    Text("date:  \(viewModel.selectedDate.toString)")
                    Spacer()
                    Button(viewModel.showDatePickerButtonLabel) {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            viewModel.showDatePicker.toggle()
                        }
                    }
                }
                if viewModel.showDatePicker { datePicker }
                
                Picker("service", selection: $viewModel.service) {
                    ForEach(Service.allCases, id: \.self) {
                        Text($0.description)
                    }
                }
                .pickerStyle(.segmented)
                
                HStack {
                    Text("Heures: " + viewModel.overtime.toString())
                    Stepper("",
                            onIncrement: { viewModel.overtime += 0.25 },
                            onDecrement: { viewModel.overtime -= 0.25 }
                    )
                }
            }
        }
        
        //            Form {
        //                Section {
        //                    HStack {
        //                        Text("Nom: ")
        //                        TextField("nom", text: $viewModel.firstName)
        //                    }
        //                    HStack {
        //                        Text("Prenom: ")
        //                        TextField("prenom", text: $viewModel.lastName)
        //                    }
        //                    HStack {
        //                        Text("Heures: " + viewModel.overtime.toString())
        //                        Stepper("",
        //                                onIncrement: { viewModel.overtime += 0.25 },
        //                                onDecrement: { viewModel.overtime -= 0.25 }
        //                        )
        //                    }
        //                }
        //
        //                HStack {
        //                    Spacer()
        //                    Button("add") {
        //                        viewModel.showPopup.toggle()
        //                    }
        //                    .buttonStyle(.bordered)
        //                    .actionSheet(isPresented: $viewModel.showPopup) {
        //                        ActionSheet(title: Text("Confirmer"),
        //                                    message:Text( viewModel.getPopupValidationMessage()),
        //                                    buttons: [
        //                                        .cancel(Text("Non")),
        //                                        .default(Text("Oui")) {
        //                                            employees.append(viewModel.createEmployee())
        //                                            dismiss()
        //                                        }
        //                                    ])
        //                    }
        //                    Spacer()
        //                    Button("dismiss") {
        //                        dismiss()
        //                    }
        //                    .buttonStyle(.bordered)
        //                    Spacer()
        //                }
        //            }
    }
}

struct NewEntryView_Previews: PreviewProvider {
    static var previews: some View {
        NewEntryView()
    }
}

extension NewEntryView {
    var datePicker: some View {
        DatePicker("",
                   selection: $viewModel.selectedDate,
                   displayedComponents: [.date])
        .datePickerStyle(WheelDatePickerStyle())
        .labelsHidden()
    }
}
