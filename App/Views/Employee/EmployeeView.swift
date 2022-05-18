//
//  EmployeeView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 15/05/2022.
//

import SwiftUI

struct EmployeeView: View {

    @ObservedObject var viewModel = EmployeeViewModel()
    @StateObject var employee: Employee
    
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
                    NewEntryView(employee: employee)
                }
                List {
                    ForEach($employee.entries) { $entry in
                        EntryRowView(entry: $entry)
                    }
                    .onDelete(perform: { offsets in
                        employee.deleteEntry(atOffsets: offsets)
                    }
                    )
                }
            }
            .navigationTitle(employee.displayableName)
        }
    }
}

struct EmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeView(employee: EmployeeFactory.employee)
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
