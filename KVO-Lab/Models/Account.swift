//
//  Account.swift
//  KVO-Lab
//
//  Created by Juan Ceballos on 4/12/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

@objc class Account: NSObject {
    
    let name: String
    @objc dynamic var balance: Double
    
    init(name: String, balance: Double) {
        self.name = name
        self.balance = balance
    }
}
