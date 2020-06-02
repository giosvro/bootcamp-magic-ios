//
//  CoreData.swift
//  Bootcamp Magic
//
//  Created by giovanni.s.barros on 01/06/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import CoreData
import UIKit

class CoreData {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func saveCoreData(card: Card, imageData: Data?) {
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CardCoreData", in: managedContext)!
        
        let cardCoreData = NSManagedObject(entity: entity, insertInto: managedContext) as? CardCoreData
        cardCoreData?.id = card.id
        cardCoreData?.name = card.name
        cardCoreData?.types = card.types as [NSString]
        cardCoreData?.set = card.set
        cardCoreData?.imageUrl = card.imageUrl
        cardCoreData?.image = imageData
                
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getElementCoreData() -> [CardCoreData]? {
        var cardsList: [CardCoreData]?
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CardCoreData")
        
        do {
            cardsList = try managedContext.fetch(fetchRequest) as? [CardCoreData]
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return cardsList
    }
    
    func deleteElementCoreData(id: String) {
        var cardsList: [CardCoreData]?
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CardCoreData")
        do {
            cardsList = try managedContext.fetch(fetchRequest) as? [CardCoreData]
            cardsList = cardsList?.filter ({$0.id == id})
            guard let card = cardsList?.first else { return }
            managedContext.delete(card)
            try managedContext.save()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}
