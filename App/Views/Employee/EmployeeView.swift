//
//  EmployeeView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 15/05/2022.
//

import SwiftUI

struct EmployeeView: View {

    @Binding var employee: Employee
    @ObservedObject var viewModel = EmployeeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("overtime: " + employee.overtime.toString())
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
                    NewEntryView(employee: $employee)
                }
                List {
                    ForEach(employee.entries) { entry in
                        EntryRowView(entry: entry)
                    }
                    .onDelete(perform: { offset in
                        guard let index = offset.first else { return }
                        employee.overtime -= employee.entries[index].overtime
                        employee.entries.remove(atOffsets: offset)
                    })
                }
            }
            .navigationTitle(employee.displayableName)
        }
    }
}

struct EmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeView(employee: .constant(EmployeeFactory.employee))
    }
}

struct EntryRowView: View {
    
    var entry: TimeEntry
    
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
