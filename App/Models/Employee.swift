
import Foundation

class Employee: Identifiable, ObservableObject {
    let id: UUID
    let firstName: String
    let lastName: String
    let creationDate: Date
    var overtime: Double
    var entries: [TimeEntry]
    
    var displayableName: String { lastName + " " + firstName }
    
    init(id: UUID = UUID(), entries: [TimeEntry] = [], firstName: String, lastName: String, overtime: Double, creationDate: Date = .now) {
        self.id = id
        self.entries = entries.sortByCreationDate
        self.firstName = firstName
        self.lastName = lastName
        self.overtime = overtime
        self.creationDate = creationDate
    }
    
    init(entity: EmployeeEntity) {
        self.id = entity.id
        self.entries = entity.entries.compactMap(TimeEntry.init(entity:))
        self.firstName = entity.firstName
        self.lastName = entity.lastName
        self.overtime = entity.overtime
        self.creationDate = entity.creationDate
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
    
    var asEntity: EmployeeEntity {
        EmployeeEntity(id: id,
                       entries: entries.compactMap { $0.asEntity },
                       firstName: firstName,
                       lastName: lastName,
                       overtime: overtime,
                       creationDate: creationDate)
    }
}

extension Array where Element == Employee {
    var sortByLastName: Self {
        self.sorted(by: { $0.lastName < $1.lastName })
    }
}
