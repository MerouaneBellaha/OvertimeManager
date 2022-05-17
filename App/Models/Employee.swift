
import Foundation

class Employee: Identifiable, ObservableObject {
    let id: UUID
    var entries: [TimeEntry]
    
    let firstName: String
    let lastName: String
    var overtime: Double
    let creationDate = Date()
    
    init(id: UUID = UUID(), entries: [TimeEntry] = [], firstName: String, lastName: String, overtime: Double) {
        self.id = id
        self.entries = entries
        self.firstName = firstName
        self.lastName = lastName
        self.overtime = overtime
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
