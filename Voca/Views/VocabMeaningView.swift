//
//  VocabMeaningView.swift
//  Voca
//
//  Created by Yon Thiri Aung on 11/07/2024.
//

import SwiftUI

struct VocabMeaningView: View {
    
    //MARK: - PROPERTIES
    var word : String
    var phonetics : String
    var type : String
    var meaning : String
    
    //MARK: - BODY
    var body: some View {
        
        VStack {
            VStack(alignment: .leading, spacing: 30) {
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    HStack(spacing: 15) {
                        
                        ActionButtonView(iconName: .soundIcon, size: 40, action: {
                            
                        })
                        
                        Text("\(word)")
                            .font(.vocabularyText)
                            .foregroundStyle(.black)
                        
                    }
                    
                    Text("\(phonetics)")
                        .font(.normalText)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                VStack(alignment: .leading,spacing: 15) {
                    Text("(\(type))")
                        .font(.typeText)
                        .foregroundStyle(Color.tint)
                    
                    Text("\(meaning)")
                        .font(.normalText)
                        .foregroundStyle(.black)
                        .lineSpacing(10)
                }
                
            }
            .padding()
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .frame(minHeight: 250)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.accentColor)
            )
            
        }
        
        
        
    }
}

#Preview {
    VocabMeaningView(word: "Word", phonetics: "phonetics", type: "type", meaning: "meaning")
}
