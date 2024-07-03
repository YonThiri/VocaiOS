//
//  CustomButtonModifier.swift
//  Voca
//
//  Created by Yon Thiri Aung on 08/06/2024.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
            content
                .frame(maxWidth: .infinity)
                .frame(height: buttonHeight)
                .background(
                    Capsule()
                        .fill(Color.background)
                
                )
        }
}
