//
//  CProduct+CoreDataProperties.swift
//  Todo-Interview
//
//  Created by Dat Van on 05/08/2022.
//
//

import Foundation
import CoreData


extension CProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CProduct> {
        return NSFetchRequest<CProduct>(entityName: "CProduct")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var quantity: Int16
    @NSManaged public var type: Int16

}

extension CProduct : Identifiable {

}
