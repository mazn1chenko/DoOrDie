//
//  UserDefaultsManager.swift
//  DoOrDie
//
//  Created by m223 on 05.08.2023.
//

import Foundation

// MARK: - CRUD

protocol UserDefaultsManagerProtocol {
    
    func set(_ object: Any?, forKey key: UserDefaultsManager.Keys)
    func set<T: Encodable>(object: T?, forKey key: UserDefaultsManager.Keys)
    
    func int(forKey key: UserDefaultsManager.Keys) -> Int?
    func string(forKey key: UserDefaultsManager.Keys) -> String?
    func dict(forKey key: UserDefaultsManager.Keys) -> [String: Any]?
    func date(forKey key: UserDefaultsManager.Keys) -> Date?
    func bool(forKey key: UserDefaultsManager.Keys) -> Bool?
    func data(forKey key: UserDefaultsManager.Keys) -> Date?
    func codableData<T: Decodable>(forKey key: UserDefaultsManager.Keys) -> T?
    
}

final class UserDefaultsManager {
    
    public enum Keys: String {
        
        case nameOfUser
        case passwordUser
        
    }
    
    private let userDefaults = UserDefaults.standard
    
    private func store(_ objc: Any?, key: String) {
        userDefaults.set(objc, forKey: key)
        
    }
    
    private func restore(forKey key: String) -> Any? {
        
        userDefaults.object(forKey: key)
    }
    
}


//MARK: - UserDefaultsManagerProtocol

extension UserDefaultsManager: UserDefaultsManagerProtocol {
    func set(_ object: Any?, forKey key: Keys) {
        store(object, key: key.rawValue)
    }
    
    func set<T: Encodable>(object: T?, forKey key: Keys) {
        let jsonData = try? JSONEncoder().encode(object)
        store(object, key: key.rawValue)
    }
    
    func int(forKey key: Keys) -> Int? {
        restore(forKey: key.rawValue) as? Int

    }
    
    func string(forKey key: Keys) -> String? {
        restore(forKey: key.rawValue) as? String

    }
    
    func dict(forKey key: Keys) -> [String : Any]? {
        restore(forKey: key.rawValue) as? [String : Any]

    }
    
    func date(forKey key: Keys) -> Date? {
        restore(forKey: key.rawValue) as? Date

    }
    
    func bool(forKey key: Keys) -> Bool? {
        restore(forKey: key.rawValue) as? Bool

    }
    
    func data(forKey key: Keys) -> Date? {
        restore(forKey: key.rawValue) as? Date

    }
    
    func codableData<T: Decodable>(forKey key: Keys) -> T? {
        guard let data = restore(forKey: key.rawValue) as? Data else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    func remove(forKey key: Keys) {
        
        userDefaults.removeObject(forKey: key.rawValue)
    }
    
}
