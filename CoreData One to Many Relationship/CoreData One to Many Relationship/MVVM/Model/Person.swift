//
//  Person.swift
//  CoreData One to Many Relationship
//
//  Created by AbdurRehmanNineSol on 10/10/2022.
//

import Foundation

class Person {
    
    let id: UUID
    let name: String
    var vehicles: [Vehicle]? // Optional because a person may or may not be have a Vehicle
    
    init(id: UUID, name: String, vehicles: [Vehicle]? = nil) {
        self.id = id
        self.name = name
        self.vehicles = vehicles
    }
    
    func displayData() {
        print(id, name, vehicles?.count)
        for v in vehicles! {
            print(v.id, v.name, v.type, v.ownerName)
        }
    }
}
