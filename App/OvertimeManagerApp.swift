//
//  OvertimeManagerApp.swift
//  Shared
//
//  Created by Merouane Bellaha on 14/05/2022.
//

import SwiftUI
import Firebase

@main
struct OvertimeManagerApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
