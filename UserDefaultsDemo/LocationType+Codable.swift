//
//  LocationType+Codable.swift
//  UserDefaultsDemo
//
//  Created by Hugues Stéphano TELOLAHY on 7/7/19.
//  Copyright © 2019 d2factory. All rights reserved.
//

extension LocationType: Codable {
    private enum CodingKeys: String, CodingKey {
        case nearest
        case region
        case store
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .none:
            break
        case .nearest:
            try container.encode(true, forKey: .nearest)
        case .region(let postalCode):
            try container.encode(postalCode, forKey: .region)
        case .specific(let storeId):
            try container.encode(storeId, forKey: .store)
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let _ = try? container.decode(Bool.self, forKey: .nearest) {
            self = .nearest
            return
        }
        
        if let code = try? container.decode(String.self, forKey: .region) {
            self = .region(postalCode: code)
            return
        }
        
        if let storeId = try? container.decode(String.self, forKey: .store) {
            self = .specific(storeId: storeId)
            return
        }
        
        self = .none
    }
}

