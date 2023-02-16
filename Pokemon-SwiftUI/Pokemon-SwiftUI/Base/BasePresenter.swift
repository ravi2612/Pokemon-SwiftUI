//
//  BasePresenter.swift
//  SGUBeta
//
//  Created by Daniel Reis on 19/01/21.
//

import SwiftUI
import Combine

class BasePresenter {
    
    let objectWillChange = ObservableObjectPublisher()
    
    @Published var error: Bool = false {
        willSet { self.objectWillChange.send() }
    }
    
    @Published var success: Bool = false {
        willSet { self.objectWillChange.send() }
    }
    
    @Published var loading: Bool = false {
        willSet { self.objectWillChange.send() }
    }
    
    var router: BaseRouter!
    var controller: UIViewController!
    
    convenience init(router: BaseRouter) {
        self.init()
        
        self.router = router
    }
    
    func dismiss() {
        router.dismiss()
    }
}
