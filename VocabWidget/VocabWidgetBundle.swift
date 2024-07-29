//
//  VocabWidgetBundle.swift
//  VocabWidget
//
//  Created by Yon Thiri Aung on 25/07/2024.
//

import WidgetKit
import SwiftUI

@main
struct VocabWidgetBundle: WidgetBundle {
    var body: some Widget {
        VocabWidget()
        VocabWidgetLiveActivity()
    }
}
