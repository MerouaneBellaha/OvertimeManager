//
//  FormButtonsView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import SwiftUI

struct FormButtonsView: View {
    
    @Binding var onAdd: Bool
    var onDismiss: () -> Void
    
    var body: some View {
        HStack {
            Button("dismiss") {
                onDismiss()
            }
            Spacer()
            Button("add") {
                onAdd.toggle()
            }
        }
        .buttonStyle(.bordered)
    }
}
