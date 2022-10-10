//
//  Vehicle.swift
//  CoreData One to Many Relationship
//
//  Created by AbdurRehmanNineSol on 10/10/2022.
//

import Foundation

class Vehicle {
    let id: UUID
    let name: String
    let type: String
    var ownerName: String?
    
    init(id: UUID, name: String, type: String, ownerName: String? = nil) {
        self.id = id
        self.name = name
        self.type = type
        self.ownerName = ownerName
    }
}
