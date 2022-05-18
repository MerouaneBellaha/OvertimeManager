
import Foundation

class Employee: Identifiable, ObservableObject {
    var entries: [TimeEntry]
    let id: UUID
    
    let firstName: String
    let lastName: String
    var overtime: Double
    let creationDate = Date()
    var displayableName: String { lastName + " " + firstName }
    
    init(id: UUID = UUID(), entries: [TimeEntry] = [], firstName: String, lastName: String, overtime: Double) {
        self.id = id
        self.entries = entries.sortByCreationDate
        self.firstName = firstName
        self.lastName = lastName
        self.overtime = overtime
    }
    
    func deleteEntry(atOffsets offsets: IndexSet) {
        guard let index = offsets.first else { return }
        overtime -= entries[index].overtime
        entries.remove(atOffsets: offsets)
    }
    
    func addEntry(entry: TimeEntry) {
        entries.insert(entry, at: 0)
        overtime += entry.overtime
    }
}

extension Array where Element == Employee {
    var sortByLastName: Self {
        self.sorted(by: { $0.lastName < $1.lastName })
    }
}
