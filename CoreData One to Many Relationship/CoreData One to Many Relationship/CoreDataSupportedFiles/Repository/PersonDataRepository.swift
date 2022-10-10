//
//  PersonDataRepository.swift
//  CoreData One to Many Relationship
//
//  Created by AbdurRehmanNineSol on 10/10/2022.
//

import Foundation

protocol PersonRepository: BaseProtocol {
    
}

struct PersonDataRepository: PersonRepository {
 
    func create(record: Person) {
        let cdPerson = CDPerson(context: PersistentStorage.shared.context)
        cdPerson.id = record.id
        cdPerson.name = record.name
            
        if (record.vehicles != nil && record.vehicles?.count != 0) {
            
            var vehicles = Set<CDVehicle>()
            record.vehicles?.forEach({ (vehicle) in
                let cdVehicle = CDVehicle(context: PersistentStorage.shared.context)
                cdVehicle.id = vehicle.id
                cdVehicle.name = vehicle.name
                cdVehicle.type = vehicle.type
                vehicles.insert(cdVehicle)
            })
            cdPerson.toVehicle = vehicles
        }
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Person]? {
        let records = PersistentStorage.shared.fetchManagerObjects(managedObject: CDPerson.self)
        var persons: [Person] = []
        records?.forEach({ person in
            persons.append(person.convertToPerson())
        })
        return persons
    }
    
    func get(byIdentifier id: UUID) -> Person? {
        return nil
    }
    
    func update(record: Person) -> Bool {
        return false
    }
    
    func delete(byIdentifier id: UUID) -> Bool {
        return false
    }
    
    typealias T = Person
}
