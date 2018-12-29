//
//  RepositoriesModel+CoreDataProperties.swift
//  
//
//  Created by Nrmeen Tomoum on 12/29/18.
//
//

import Foundation
import CoreData


extension RepositoriesModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RepositoriesModel> {
        return NSFetchRequest<RepositoriesModel>(entityName: "RepositoriesModel")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var reposDesc: String?

}
