//
//  Service.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import Foundation

enum Service: CaseIterable {
    case lunch, evening
    
    var description: String {
        switch self {
        case .lunch: return "midi"
        case .evening: return "soir"
        }
    }
}
