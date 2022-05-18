//
//  HStackTwoButtonsView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import SwiftUI

struct HStackTwoButtonsView: View {
    
    var left: ButtonViewModel
    var right: ButtonViewModel
    
    var body: some View {
        HStack {
            Button(left.title) { left.action() }
            Spacer()
            Button(right.title) { right.action() }
        }
        .buttonStyle(.bordered)
        .font(.body)
    }
}

struct ButtonViewModel {
    var title: String
    var action: () -> Void
}
