//
//  ConfirmationSheet.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import SwiftUI

struct ConfirmationSheet: ViewModifier {
    @Binding var show: Bool
    var message: String
    var action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .confirmationDialog("",
                                isPresented: $show,
                                actions: {
                Button("Non", role: .cancel) {}
                Button("Oui") {
                    action()
                }
            }, message: { Text(message) })
    }
}

extension View {
    func confirmationSheet(
        isPresented: Binding<Bool>,
        message: String,
        action: @escaping () -> Void) -> some View {
            modifier(ConfirmationSheet(show: isPresented, message: message, action: action))
        }
}
