//
//  WaterDate+CoreDataProperties.swift
//  plants
//
//  Created by Wesley Espinoza on 5/15/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//
//

import Foundation
import CoreData


extension WaterDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WaterDate> {
        return NSFetchRequest<WaterDate>(entityName: "WaterDate")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var plant: Plant?

}
