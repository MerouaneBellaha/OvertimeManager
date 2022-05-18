//
//  FormRowView.swift
//  OvertimeManager (iOS)
//
//  Created by Merouane Bellaha on 18/05/2022.
//

import SwiftUI

struct FormRowView<Content: View>: View {
    var text: String
    let content: Content
    
    init(text: String, @ViewBuilder content: () -> Content) {
        self.text = text
        self.content = content()
    }
    
    var body: some View {
        HStack {
            Text(text)
            content
        }
    }
}
