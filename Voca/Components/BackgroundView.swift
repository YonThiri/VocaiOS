//
//  BackgroundView.swift
//  Voca
//
//  Created by Yon Thiri Aung on 08/06/2024.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack(alignment: .top) {
            // Background Color
            Color.accentColor
                .ignoresSafeArea()
            
            // Background Image
            Image("BackgroundObject")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
            
        }
    }
}

#Preview {
    BackgroundView()
}
