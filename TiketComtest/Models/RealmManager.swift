//
//  RealmManager.swift
//  TiketComtest
//
//  Created by reza pahlevi on 30/01/21.
//

import Foundation
import RealmSwift
import Realm

class RealmManager: NSObject {
    let realm = try! Realm()
    static let shared = RealmManager()
    
    var heroModel: Results<HeroModel>?
    
    // MARK: - READ/LOAD OBJECT
    func loadRealmObject() {
        heroModel = realm.objects(HeroModel.self)
    }
    
    func retrieveAllDataForObject(_ T : Object.Type) -> [Object] {
        
        var objects = [Object]()
        for result in realm.objects(T) {
            objects.append(result)
        }
        return objects
    }
    
    func deleteAllDataForObject(_ T : Object.Type) {
        
        self.delete(self.retrieveAllDataForObject(T))
    }
    
    func replaceAllDataForObject(_ T : Object.Type, with objects : [Object]) {
        
        deleteAllDataForObject(T)
        add(objects)
    }
    
    func add(_ objects : [Object], completion : @escaping() -> ()) {
        
        try! realm.write{
            
            realm.add(objects)
            completion()
        }
    }
    
    func add(_ objects : [Object]) {
        
        try! realm.write{
            
            realm.add(objects)
        }
    }
    
    func add(_ objects : Object) {
        
        try! realm.write{
            
            realm.add(objects)
        }
    }
    
    func update(_ block: @escaping ()->Void) {
        
        try! realm.write(block)
    }
    
    func delete(_ objects : [Object]) {
        
        try! realm.write{
            realm.delete(objects)
        }
    }
    
    func delete(_ objects : Object) {
        
        try! realm.write{
            realm.delete(objects)
        }
    }
}
