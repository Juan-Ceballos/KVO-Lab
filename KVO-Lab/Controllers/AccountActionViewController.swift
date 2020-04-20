//
//  AccountActionViewController.swift
//  KVO-Lab
//
//  Created by Juan Ceballos on 4/8/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class AccountActionViewController: UIViewController {
    
    var account: Account?
    
    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTextField.delegate = self
    }
   
    @IBAction func withdrawButtonPressed(_ sender: UIButton) {
        guard let selectedAccount = account   else    {
            fatalError()
        }
        
        guard let amountToWithdrawText = amountTextField.text,
            !amountToWithdrawText.isEmpty,
        let amountToWithdraw = Double(amountToWithdrawText)
            else   {
                return
            }
        
        selectedAccount.balance -= amountToWithdraw
        print(selectedAccount.balance)
    }
    
    
    @IBAction func depositButtonPressed(_ sender: UIButton) {
        guard let selectedAccount = account   else    {
                fatalError()
            }
            
            guard let amountToWithdrawText = amountTextField.text,
                !amountToWithdrawText.isEmpty,
            let amountToWithdraw = Double(amountToWithdrawText)
                else   {
                    return
                }
            
            selectedAccount.balance -= amountToWithdraw
            print(selectedAccount.balance)
    }
}


extension AccountActionViewController: UITextFieldDelegate  {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
