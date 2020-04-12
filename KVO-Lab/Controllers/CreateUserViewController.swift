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
                    let newUser = User(name: newUserName, balance: balance)
                    Bank.shared.users.append(newUser)
                    print(Bank.shared.users)
        }
    }
    
}

extension CreateUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


