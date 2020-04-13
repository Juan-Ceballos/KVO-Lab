//
//  CreateUserViewController.swift
//  KVO-Lab
//
//  Created by Juan Ceballos on 4/8/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class CreateUserViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var startingBalanceTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        startingBalanceTextField.delegate = self
    }

    
    @IBAction func createButtonPressed(_ sender: UIButton) {
        if let newUserName = userNameTextField.text,
            let newBalance = startingBalanceTextField.text,
            let balance = Double(newBalance)
                {
                    let newAccount = Account(name: newUserName, balance: balance)
                    let newUser = User(account: newAccount)
                    Bank.shared.users.append(newUser)
                    print("New User")
        }
    }
    
}

extension CreateUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


