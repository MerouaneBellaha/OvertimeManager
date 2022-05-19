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
        VStack {
            HStack {
                Text("overtime: " + viewModel.employee.overtime.toString())
                Spacer()
                Button("add new entry") {
                    viewModel.showModal.toggle()
                }
                .buttonStyle(.bordered)
                .popover(isPresented: $viewModel.showModal) {
                    NewEntryView(viewModel:
                                    NewEntryViewModel(employee: viewModel.employee)
                    )
                }
            }
            .padding()
            
            List {
                ForEach($viewModel.employee.entries) { $entry in
                    EntryRowView(entry: $entry)
                }
                .onDelete(perform: viewModel.didSwapToDeleteEntry)
            }
        }
    }
}

struct EmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeView(viewModel: EmployeeViewModel(employee: EmployeeFactory.employee))
    }
}

struct EntryRowView: View {
    
    @Binding var entry: TimeEntry
    
    var body: some View {
        HStack {
            Text(entry.displayableDate)
                .padding(.trailing)
            Text(entry.service.description)
            Spacer()
            Text(entry.overtime.toString())
        }
    }
}
