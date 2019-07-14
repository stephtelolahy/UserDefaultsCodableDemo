//
//  UserDefaultsProvider.swift
//  UserDefaultsDemo
//
//  Created by Hugues Stéphano TELOLAHY on 7/6/19.
//  Copyright © 2019 d2factory. All rights reserved.
//

import Foundation

protocol UserDefaultsProviderProtocol {
    var locationType: LocationType { get set }
}

class UserDefaultsProvider: UserDefaultsProviderProtocol {
    private let defaults: UserDefaultsProtocol
    
    init(defaults: UserDefaultsProtocol) {
        self.defaults = defaults
    }
    
    var locationType: LocationType {
        
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                defaults.set(encoded, forKey: "locationType")
            }
        }
        
        get {
            let decoder = JSONDecoder()
            if let savedData = defaults.object(forKey: "locationType") as? Data,
                let savedLocation = try? decoder.decode(LocationType.self, from: savedData) {
                return savedLocation
            }
            return .none
        }
    }
}
