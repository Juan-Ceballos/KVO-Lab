//
//  User.swift
//  KVO-Lab
//
//  Created by Juan Ceballos on 4/8/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

@objc class User: NSObject {
    let name: String
    @objc dynamic var balance: Double
    
    init(name: String, balance: Double)  {
        self.name = name
        self.balance = balance
    }
}
