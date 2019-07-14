//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by Hugues Stéphano TELOLAHY on 7/6/19.
//  Copyright © 2019 d2factory. All rights reserved.
//

import UIKit

extension UserDefaults: UserDefaultsProtocol {
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var provider: UserDefaultsProviderProtocol = UserDefaultsProvider(defaults: UserDefaults.standard)
        
        provider.locationType = .none
//        provider.locationType = .nearest
//        provider.locationType = .region(postalCode: "60100")
//        provider.locationType = .specific(storeId: "ASE56")
        
        switch provider.locationType {
        case .none:
            print("none")
        case .nearest:
            print("nearest")
        case let .region(postalCode):
            print("region \(postalCode)")
        case let .specific(storeId):
            print("specific \(storeId)")
        }
        
    }
}
