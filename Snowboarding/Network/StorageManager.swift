//
//  StorageManager.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 01.09.2024.
//

import CoreData

final class StorageManager {
    
    static let shared = StorageManager()
    
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Cache")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data error \(error)")
            }
        }
        return container
    }()
    
    private var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init (){}
    
    func saveFile(
        _ allTracks: String?,
        _ apiWeather: String?,
        _ descroption: String?,
        _ heightDifference: String?,
        _ imageSkiR: String?,
        _ latitudeMap: Double?,
        _ longitudeMap: Double?,
        _ nameSkiResot: String?,
        _ totalLengthOfTracks: String?
    ) {
        let file = SkiCache(context: viewContext)
        file.allTracks = allTracks
        file.apiWeather = apiWeather
        file.descroption = descroption
        file.heightDifference = heightDifference
        file.imageSkiR = imageSkiR
        file.latitudeMap = latitudeMap ?? 0.0
        file.longitudeMap = longitudeMap ?? 0.0
        file.nameSkiResot = nameSkiResot
        file.totalLengthOfTracks = totalLengthOfTracks
    }
    
    func fetchData(completion: (Result<[SkiCache], Error>) -> Void) {
        let fetchRequest = SkiCache.fetchRequest()
        do {
            let ski = try viewContext.fetch(fetchRequest)
            ski.forEach { viewContext.delete($0) }
        } catch let error {
            print(error.localizedDescription)
            completion(.failure(error))
        }
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                viewContext.rollback()
            }
        }
    }
}

