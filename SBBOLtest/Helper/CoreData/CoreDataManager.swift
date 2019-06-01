//
//  CoreDataManager.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 01/06/2019.
//  Copyright © 2019 Erik Vildanov. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let sharedInstance = CoreDataManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SBBOLtest")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    func saveContext () {
        let context = managedObjectContext()
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    private func managedObjectContext() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private func getManagerObjectHistory() -> NSManagedObject {
        let managedContext = managedObjectContext()
        let entity = NSEntityDescription.entity(forEntityName: "History", in: managedContext)!
        return NSManagedObject(entity: entity, insertInto: managedContext)
    }
    
    func insertItem(source: String, translate: String) -> History? {
        guard !isFetchHistory(by: translate) else { return nil }
        let history = getManagerObjectHistory()
        history.setValue(source, forKey: "sourceText")
        history.setValue(translate, forKey: "translate")
        do {
            try managedObjectContext().save()
            return history as? History
        } catch {
            print("insertItem: ", error.localizedDescription)
            return nil
        }
    }
    
    func fetchAllHistory() -> [History]? {
        let managedContext = managedObjectContext()
        let fetchRequest = NSFetchRequest<History>(entityName: "History")
        do {
            let history = try managedContext.fetch(fetchRequest)
            return history
        } catch {
            print("fetchAllHistory: ", error.localizedDescription)
            return nil
        }
    }
    private func isFetchHistory(by translate: String) -> Bool {
        let managedContext = managedObjectContext()
        
        let fetchRequest = NSFetchRequest<History>(entityName: "History")
        fetchRequest.predicate = NSPredicate(format: "translate == %@", translate)
        
        do {
            let computer = try managedContext.fetch(fetchRequest)
            if computer.count == 0 {
                return false
            }
            return true
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
    
    func deleteAllHistory() {
        let managedContext = managedObjectContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "History")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try managedContext.execute(batchDeleteRequest)
        } catch {
            print("deleteAllHistory: ", error.localizedDescription)
        }
    }
    
    func deleteItem(word: History) {
        let managedContext = managedObjectContext()
        managedContext.delete(word)
        do {
            try managedContext.save()
        } catch {
            print("deleteItem: ", error.localizedDescription)
        }
    }
}
