//
//  VehicleDataRepository.swift
//  CoreData One to Many Relationship
//
//  Created by AbdurRehmanNineSol on 10/10/2022.
//

import Foundation
import CoreData

protocol VehicleRepository: BaseProtocol {
    
}

struct VehicleDataRepository: VehicleRepository {
    func create(record: Vehicle) {
        let cdVehicle = CDVehicle(context: PersistentStorage.shared.context)
        cdVehicle.id = record.id
        cdVehicle.name = record.name
        cdVehicle.type = record.type

        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Vehicle]? {
        
        let records = PersistentStorage.shared.fetchManagerObjects(managedObject: CDVehicle.self)
        guard records != nil && records?.count != 0 else { return nil }
        
        var vehicles: [Vehicle] = []
        records?.forEach({ vehicle in
            vehicles.append(vehicle.convertToVehicle())
        })
        return vehicles
    }
    
    func get(byIdentifier id: UUID) -> Vehicle? {
        let cdVehicle = getVehicle(byIdentifier: id)
        guard cdVehicle != nil else { return nil }
        return cdVehicle?.convertToVehicle()
    }
    
    func update(record: Vehicle) -> Bool {
        let cdVehicle = getVehicle(byIdentifier: record.id)
        guard cdVehicle != nil else { return false }
        
        cdVehicle?.name = record.name
        cdVehicle?.type = record.type
        
//        if record. != nil {
////            let cdPassport = CDPassport(context: PersistentStorage.shared.context)
//            cdEmployee?.toPassport?.passportId = record.passport?.passportId
//            cdEmployee?.toPassport?.placeOfIssue = record.passport?.placeOfIssue
//        }
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(byIdentifier id: UUID) -> Bool {
        let cdVehicle = getVehicle(byIdentifier: id)
        guard cdVehicle != nil else { return false }
        PersistentStorage.shared.context.delete(cdVehicle!)
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func getVehicle(byIdentifier id: UUID) -> CDVehicle? {
        let fetchRecords = NSFetchRequest<CDVehicle>(entityName: "CDVehicle")
        let predicte = NSPredicate(format: "id=%@", id as CVarArg)
        fetchRecords.predicate = predicte
        
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRecords).first
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    
    typealias T = Vehicle
}
