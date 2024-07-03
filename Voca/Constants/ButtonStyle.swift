//
//  ButtonStyle.swift
//  Voca
//
//  Created by Yon Thiri Aung on 08/06/2024.
//

import Foundation
import SwiftUI

struct PressedButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
    }
}
