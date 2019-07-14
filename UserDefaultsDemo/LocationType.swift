//
//  LocationType.swift
//  UserDefaultsDemo
//
//  Created by Hugues Stéphano TELOLAHY on 7/7/19.
//  Copyright © 2019 d2factory. All rights reserved.
//

/// Store location choices
///
enum LocationType: Equatable {
    case none
    case nearest
    case region(postalCode: String)
    case specific(storeId: String)
}
