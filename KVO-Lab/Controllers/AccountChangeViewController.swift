//
//  AccountChangeViewController.swift
//  KVO-Lab
//
//  Created by Juan Ceballos on 4/8/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class AccountChangeViewController: UIViewController {
    
    @IBOutlet weak var accountsTableView: UITableView!
    
    private var account: Account?
    private var bankObservation: NSKeyValueObservation?
    private var userBalanceObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountsTableView.dataSource = self
        configureBankObservation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let accountActionVC = segue.destination as? AccountActionViewController, let indexPath = accountsTableView.indexPathForSelectedRow else {
             fatalError("could not segue")
           }
        
        account = Bank.shared.users[indexPath.row].account
        let user = User(account: account ?? Account(name: "", balance: 0.0))
        
        userBalanceObservation = account?.observe(\.balance, options: [.old, .new], changeHandler: { (account, change) in
            self.accountsTableView.reloadData()
            Bank.shared.users[indexPath.row] = user
        })
        
        accountActionVC.account = account
    }
    
    private func configureBankObservation() {
        bankObservation = Bank.shared.observe(\.users, options: [.old, .new], changeHandler: { (bank, change) in
            self.accountsTableView.reloadData()
            print("balance test")
        })
    }
    
}

extension AccountChangeViewController: UITableViewDataSource    {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Bank.shared.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath)
        let cAccount = Bank.shared.users[indexPath.row].account
        cell.textLabel?.text = cAccount.name
        cell.detailTextLabel?.text = cAccount.balance.description
        return cell
    }
    
}
