//
//  User.swift
//  KVO-Lab
//
//  Created by Juan Ceballos on 4/8/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

class User: NSObject {
    var account: Account
    
    init(account: Account) {
        self.account = account
    }
}
