//
//  CDPerson.swift
//  CoreData One to Many Relationship
//
//  Created by AbdurRehmanNineSol on 10/10/2022.
//

import Foundation

extension CDPerson {
    
    func convertToPerson() -> Person {
        
//        let CDVehicles: [CDVehicle] =  Array(self.toVehicle!)
        
        return Person(id: self.id!, name: self.name!, vehicles: self.convertToVehicles())
    }
    
    func convertToVehicles() -> [Vehicle]? {
        
        guard self.toVehicle != nil && self.toVehicle?.count != 0 else { return nil }
        
        var vehicles: [Vehicle] = []
        vehicles.removeAll()
        
        self.toVehicle?.forEach { vehicle in
            vehicles.append(vehicle.convertToVehicle())
        }
        return vehicles
    }
}
