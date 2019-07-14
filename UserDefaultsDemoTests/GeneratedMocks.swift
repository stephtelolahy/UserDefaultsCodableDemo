import Cuckoo
@testable import UserDefaultsDemo


 class MockUserDefaultsProtocol: UserDefaultsProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = UserDefaultsProtocol
    
     typealias Stubbing = __StubbingProxy_UserDefaultsProtocol
     typealias Verification = __VerificationProxy_UserDefaultsProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: UserDefaultsProtocol?

     func enableDefaultImplementation(_ stub: UserDefaultsProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func set(_ value: Any?, forKey defaultName: String)  {
        
    return cuckoo_manager.call("set(_: Any?, forKey: String)",
            parameters: (value, defaultName),
            escapingParameters: (value, defaultName),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.set(value, forKey: defaultName))
        
    }
    
    
    
     func object(forKey defaultName: String) -> Any? {
        
    return cuckoo_manager.call("object(forKey: String) -> Any?",
            parameters: (defaultName),
            escapingParameters: (defaultName),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.object(forKey: defaultName))
        
    }
    

	 struct __StubbingProxy_UserDefaultsProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func set<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.Matchable>(_ value: M1, forKey defaultName: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(Any?, String)> where M1.OptionalMatchedType == Any, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(Any?, String)>] = [wrap(matchable: value) { $0.0 }, wrap(matchable: defaultName) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockUserDefaultsProtocol.self, method: "set(_: Any?, forKey: String)", parameterMatchers: matchers))
	    }
	    
	    func object<M1: Cuckoo.Matchable>(forKey defaultName: M1) -> Cuckoo.ProtocolStubFunction<(String), Any?> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: defaultName) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockUserDefaultsProtocol.self, method: "object(forKey: String) -> Any?", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_UserDefaultsProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func set<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.Matchable>(_ value: M1, forKey defaultName: M2) -> Cuckoo.__DoNotUse<(Any?, String), Void> where M1.OptionalMatchedType == Any, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(Any?, String)>] = [wrap(matchable: value) { $0.0 }, wrap(matchable: defaultName) { $0.1 }]
	        return cuckoo_manager.verify("set(_: Any?, forKey: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func object<M1: Cuckoo.Matchable>(forKey defaultName: M1) -> Cuckoo.__DoNotUse<(String), Any?> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: defaultName) { $0 }]
	        return cuckoo_manager.verify("object(forKey: String) -> Any?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class UserDefaultsProtocolStub: UserDefaultsProtocol {
    

    

    
     func set(_ value: Any?, forKey defaultName: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func object(forKey defaultName: String) -> Any?  {
        return DefaultValueRegistry.defaultValue(for: (Any?).self)
    }
    
}

