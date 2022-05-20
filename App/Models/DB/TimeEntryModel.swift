//
//  TimeEntryModel.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import Foundation

struct TimeEntryModel: Codable {
    let id: UUID
    let date: Date
    let service: Service
    let overtime: Double
    let author: String
    let creationDate: Date
}
