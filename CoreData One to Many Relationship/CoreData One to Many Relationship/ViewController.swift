//
//  ViewController.swift
//  CoreData One to Many Relationship
//
//  Created by AbdurRehmanNineSol on 10/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let personManager = PersonManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(path[0])
//        let vehicle = Vehicle(id: UUID(), name: "CG 125", type: "Honda")
        let vehicle2 = Vehicle(id: UUID(), name: "YBR 125", type: "Yamaha")
        let vehicle3 = Vehicle(id: UUID(), name: "SZ 125", type: "Suzuki")
        let person = Person(id: UUID() , name: "Mazda", vehicles: [ vehicle2, vehicle3])
        
        personManager.create(record: person)
        let persons = personManager.getAll()
        
        persons?.forEach({ person in
            person.displayData()
        })
        

    }


}

