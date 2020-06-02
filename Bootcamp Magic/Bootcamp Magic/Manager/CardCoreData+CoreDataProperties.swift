//
//  CardCoreData+CoreDataProperties.swift
//  Bootcamp Magic
//
//  Created by giovanni.s.barros on 02/06/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//
//

import Foundation
import CoreData


extension CardCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CardCoreData> {
        return NSFetchRequest<CardCoreData>(entityName: "CardCoreData")
    }

    @NSManaged public var id: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var name: String?
    @NSManaged public var set: String?
    @NSManaged public var types: [NSString]?
    @NSManaged public var image: Data?


}
