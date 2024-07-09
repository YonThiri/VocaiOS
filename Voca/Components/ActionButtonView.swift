//
//  ActionButtonView.swift
//  Voca
//
//  Created by Yon Thiri Aung on 09/07/2024.
//

import SwiftUI

struct ActionButtonView: View {
    
    var iconName : ImageResource
    var size : CGFloat
    var action : () -> Void
    
    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
        })
        .buttonStyle(PressedButtonStyle())
    }
}

#Preview {
    ActionButtonView(iconName: .soundIcon, size: 40, action: {
        
    })
}
