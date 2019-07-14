//
//  UserDefaultsDemoTests.swift
//  UserDefaultsDemoTests
//
//  Created by Hugues Stéphano TELOLAHY on 7/7/19.
//  Copyright © 2019 d2factory. All rights reserved.
//

import XCTest
import Cuckoo

class UserDefaultsDemoTests: XCTestCase {
    
    private var provider: UserDefaultsProviderProtocol!
    private var mockDefaults: MockUserDefaultsProtocol!
    
    override func setUp() {
        mockDefaults = MockUserDefaultsProtocol().withEnabledDefaultImplementation(UserDefaultsProtocolStub())
        provider = UserDefaultsProvider(defaults: mockDefaults)
    }
    
    func test_InitialValueIsNone() {
        XCTAssertEqual(provider.locationType, .none)
    }
    
    func test_SaveStoreTypeNone() {
        provider.locationType = .none
        
        let expectedData = try! JSONEncoder().encode(LocationType.none)
        verify(mockDefaults).set(dataEqual(to: expectedData), forKey: "locationType")
    }
    
    func test_LoadStoreTypeNearest() {
        Cuckoo.stub(mockDefaults) { mock in
            let data = try! JSONEncoder().encode(LocationType.nearest)
            when(mock).object(forKey: "locationType").thenReturn(data)
        }
        
        XCTAssertEqual(provider.locationType, .nearest)
    }
    
    func test_SaveStoreTypeNearest() {
        provider.locationType = .nearest
        
        let expectedData = try! JSONEncoder().encode(LocationType.nearest)
        verify(mockDefaults).set(dataEqual(to: expectedData), forKey: "locationType")
    }
    
    func test_LoadStoreTypePostalCode() {
        Cuckoo.stub(mockDefaults) { mock in
            let data = try! JSONEncoder().encode(LocationType.region(postalCode: "75001"))
            when(mock).object(forKey: "locationType").thenReturn(data)
        }
        
        XCTAssertEqual(provider.locationType, .region(postalCode: "75001"))
    }
    
    func test_SaveStoreTypePostalCode() {
        provider.locationType = .region(postalCode: "60100")
        
        let data = try! JSONEncoder().encode(LocationType.region(postalCode: "60100"))
        verify(mockDefaults).set(dataEqual(to: data), forKey: "locationType")
    }
    
    func test_LoadStoreTypeSpecific() {
        Cuckoo.stub(mockDefaults) { mock in
            let data = try! JSONEncoder().encode(LocationType.specific(storeId: "ADE234"))
            when(mock).object(forKey: "locationType").thenReturn(data)
        }
        
        XCTAssertEqual(provider.locationType, .specific(storeId: "ADE234"))
    }
    
    func test_SaveStoreTypeSpecific() {
        provider.locationType = .specific(storeId: "ADE234")
        
        let data = try! JSONEncoder().encode(LocationType.specific(storeId: "ADE234"))
        verify(mockDefaults).set(dataEqual(to: data), forKey: "locationType")
    }
}

func dataEqual(to data: Data) -> ParameterMatcher<Any?> {
    return ParameterMatcher(matchesFunction: { value -> Bool in
        return value as? Data == data
    })
}
