//
//  OvertimeStepperView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import SwiftUI

struct OvertimeStepperView: View {
    @Binding var overtime: Double
    private let value = 0.25
    
    var body: some View {
        Stepper("",
                onIncrement: { overtime += value },
                onDecrement: { overtime -= value }
        )
    }
}
