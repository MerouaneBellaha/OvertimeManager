//
//  Double+toString.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import Foundation

extension Double {
    func toString() -> String {
        String(format: "%.2f", self)
    }
}
