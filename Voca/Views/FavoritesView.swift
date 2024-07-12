//
//  FavoritesView.swift
//  Voca
//
//  Created by Yon Thiri Aung on 11/07/2024.
//

import SwiftUI

struct FavoritesView: View {
    
    @StateObject var vm = FavoritesDataViewModel()
    
    var body: some View {
        
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            List {
                ForEach(vm.savedFavorites) { fav in
                    
                    VocabMeaningView(word: fav.word ?? "", phonetics: fav.phonetics ?? "", type: fav.type ?? "", meaning: fav.meaning ?? "")
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }
                .onDelete(perform: vm.deleteFavoriteWord)
            }
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
        }
    
    }
}

#Preview {
    FavoritesView()
}
