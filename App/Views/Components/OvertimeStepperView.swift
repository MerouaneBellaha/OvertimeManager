//
//  OvertimeStepperView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import SwiftUI

struct OvertimeStepperView: View {
    @Binding var overtime: Double
    private let incrementValue = 0.25
    
    var body: some View {
        Stepper("",
                onIncrement: { overtime += incrementValue },
                onDecrement: { overtime -= incrementValue }
        )
    }
}
