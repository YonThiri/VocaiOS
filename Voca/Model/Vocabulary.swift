//
//  Vocabulary.swift
//  Voca
//
//  Created by Yon Thiri Aung on 07/07/2024.
//

import Foundation

struct Vocabulary : Codable, Identifiable {
    
    let id : Int
    let word : String
    let phonetics : String
    let type : String
    let meaning : String
    let soundURL : String
}
