//
//  UserDefaultsProtocol.swift
//  UserDefaultsDemo
//
//  Created by Hugues Stéphano TELOLAHY on 7/7/19.
//  Copyright © 2019 d2factory. All rights reserved.
//

protocol UserDefaultsProtocol {
    func set(_ value: Any?, forKey defaultName: String)
    func object(forKey defaultName: String) -> Any?
}
