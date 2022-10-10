//
//  BaseProtocol.swift
//  CoreData One to Many Relationship
//
//  Created by AbdurRehmanNineSol on 10/10/2022.
//

import Foundation

protocol BaseProtocol {
    
    associatedtype T
    
    func create(record: T)
    func getAll() -> [T]?
    func get(byIdentifier id: UUID) -> T?
    func update(record: T) -> Bool
    func delete(byIdentifier id: UUID) -> Bool
}
