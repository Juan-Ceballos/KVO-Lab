//
//  Bank.swift
//  KVO-Lab
//
//  Created by Juan Ceballos on 4/11/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

@objc class Bank: NSObject  {
    
    static let shared = Bank()
    
    private override init() {}
    
    @objc dynamic var users = [User]()
    
}
