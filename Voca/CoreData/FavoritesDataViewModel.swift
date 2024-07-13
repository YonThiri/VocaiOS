//
//  CoreDataViewModel.swift
//  Voca
//
//  Created by Yon Thiri Aung on 09/07/2024.
//

import SwiftUI
import CoreData

class FavoritesDataViewModel : ObservableObject {
    
    let container : NSPersistentContainer
    @Published var savedFavorites : [FavoriteEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FavoritesContainers")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("DEBUG: ERROR LOADING CORE DATA \(error)")
            }
            else {
                print("DEBUG: SUCCESSFULLY LOADED CORE DATA.")
            }
        }
        
        fetchFavorites()
    }
    
    //MARK: - FETCH FAVORITES VOCABULARIES
    func fetchFavorites() {
        let request = NSFetchRequest<FavoriteEntity>(entityName: "FavoriteEntity")
        
        do {
            
            savedFavorites = try container.viewContext.fetch(request)
        }
        catch let error {
            print("DEBUG: ERROR FETCHING. \(error)")
        }
    }
    
    //MARK: - ADD TO FAVORITES
    func addFavorites(vocabulary : Vocabulary) {
        
        let favoriteWord = FavoriteEntity(context: container.viewContext)
        
        favoriteWord.id = Int16(vocabulary.id)
        favoriteWord.word = vocabulary.word
        favoriteWord.meaning = vocabulary.meaning
        favoriteWord.phonetics = vocabulary.phonetics
        favoriteWord.type = vocabulary.type
        favoriteWord.isFavorite = true
        favoriteWord.soundURL = vocabulary.soundURL
        
        saveData()
    }
    
    //MARK: - DELETE WORD FROM FAVORITES
    func deleteFavoriteWord(entity : FavoriteEntity) {
        
        container.viewContext.delete(entity)
        saveData()
    }
    
    //MARK: - SAVING DATA TO CORE DATA
    func saveData() {
        
        do {
            
            try container.viewContext.save()
            fetchFavorites()
        }
        catch let error {
            print("DEBUG: ERROR SAVING \(error).")
        }
    }
    
}
