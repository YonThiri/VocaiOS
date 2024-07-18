//
//  VocaApp.swift
//  Voca
//
//  Created by Yon Thiri Aung on 03/07/2024..
//

import SwiftUI
import FirebaseCore

@main
struct VocaApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}
