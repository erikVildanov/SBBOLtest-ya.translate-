//
//  History+CoreDataProperties.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 01/06/2019.
//  Copyright © 2019 Erik Vildanov. All rights reserved.
//
//

import Foundation
import CoreData


extension History {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History")
    }

    @NSManaged public var sourceText: String
    @NSManaged public var translate: String

}

extension History: HistoryItem {
    var translateText: String? {
        return translate
    }
    
    var source: String? {
        return sourceText
    }
}
