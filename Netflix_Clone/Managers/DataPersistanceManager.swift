//
//  DataPersistanceManager.swift
//  Netflix_Clone
//
//  Created by Hammad Ali on 05/04/2026.
//

import Foundation
import UIKit
import CoreData

class DataPersistanceManager {
    
    enum DatabasError: Error {
        case failedToSaveData
        case failedTof
    }
    
    static let shared = DataPersistanceManager()
        func downloadTitleWith(model: Title, completion: @escaping (Result<Void, Error>) ->  Void){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let item = TitleItem(context: context)
        
        item.original_title = model.original_title
        item.id = Int64(model.id)
        item.original_name = model.original_name
        item.media_type = model.media_type
        item.overview = model.overview
        item.poster_path = model.poster_path
        item.release_date = model.release_date
        item.vote_count = Int64(model.vote_count)
        item.vote_average = model.vote_average
        
        do{
            try context.save()
            completion(.success(()))
        }
        catch{
            completion(.failure(DatabasError.failedToSaveData))
        }
        
    }
    
    func fetchingTitlesFromDataBase(completion: @escaping (Result<[TitleItem] , Error>) -> Void){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<TitleItem>
        request = TitleItem.fetchRequest()
        
        do{
            try context.fetch(request)
            completion(.success(titles))
            
        } catch{
            completion(.failure(error.localizedDescription))
        }
    }
    
}
