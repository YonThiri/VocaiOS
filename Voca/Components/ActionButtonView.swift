//
//  ActionButtonView.swift
//  Voca
//
//  Created by Yon Thiri Aung on 09/07/2024.
//

import SwiftUI

struct ActionButtonView: View {
    
    var iconName : ImageResource? = nil
    var isIconBtn : Bool = true
    var title : String? = nil
    var size : CGFloat
    var action : () -> Void
    
    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            
            if isIconBtn {
                Image(iconName ?? .share)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
            }
            else {
                Text(title ?? "")
                    .font(.buttonText)
                    .foregroundStyle(Color.white)
            }
        })
        .buttonStyle(PressedButtonStyle())
    }
}

#Preview {
    ActionButtonView(iconName: .soundIcon, size: 40, action: {
        
    })
}
