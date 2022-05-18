//
//  Date+toString.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import Foundation

extension Date {
    var toString: String {
        var formatter: DateFormatter {
               let formatter = DateFormatter()
               formatter.dateFormat = "dd-MM-yyyy"
               return formatter
           }
        return formatter.string(from: self)
    }
}
