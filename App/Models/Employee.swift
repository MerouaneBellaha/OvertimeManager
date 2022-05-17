
import Foundation

class Employee: Identifiable, ObservableObject {
    @Published var entries: [TimeEntry]
    let id: UUID
    
    let firstName: String
    let lastName: String
    @Published var overtime: Double
    let creationDate = Date()
    
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
}

extension Employee {
    var displayableName: String { lastName + " " + firstName }
}

extension Array where Element == Employee {
    var sortByLastName: Self {
        self.sorted(by: { $0.lastName < $1.lastName })
    }
}
