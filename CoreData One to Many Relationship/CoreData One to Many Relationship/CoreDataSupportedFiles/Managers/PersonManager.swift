//
//  PersonManager.swift
//  CoreData One to Many Relationship
//
//  Created by AbdurRehmanNineSol on 10/10/2022.
//

import Foundation

struct PersonManager {
    
    var personDataRepository = PersonDataRepository()
    
    func create(record: Person) {
        personDataRepository.create(record: record)
    }
    
    func getAll() -> [Person]? {
        return personDataRepository.getAll()
    }
}
