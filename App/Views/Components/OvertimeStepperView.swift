//
//  OvertimeStepperView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import SwiftUI

struct OvertimeStepperView: View {
    @Binding var overtime: Double
    
    var body: some View {
        Stepper("",
                onIncrement: { overtime += 0.25 },
                onDecrement: { overtime -= 0.25 }
        )
    }
}
