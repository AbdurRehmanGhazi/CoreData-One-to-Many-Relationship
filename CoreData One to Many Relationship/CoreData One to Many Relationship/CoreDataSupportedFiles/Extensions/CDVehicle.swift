//
//  CDVehicle.swift
//  CoreData One to Many Relationship
//
//  Created by AbdurRehmanNineSol on 10/10/2022.
//

import Foundation

extension CDVehicle {

    func convertToVehicle() -> Vehicle {
        return Vehicle(id: self.id!, name: self.name!, type: self.type!, ownerName: self.toPerson?.name)
    }
}
