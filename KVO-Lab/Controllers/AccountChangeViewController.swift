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
        accountsTableView.delegate = self
        configureBankObservation()
        configureUserBalanceObservation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let accountActionVC = segue.destination as? AccountActionViewController, let indexPath = accountsTableView.indexPathForSelectedRow else {
             fatalError("could not segue")
           }
        account = Bank.shared.users[indexPath.row].account
        accountActionVC.account = account
        print(account?.balance ?? 33)
    }
    
    private func configureBankObservation() {
        bankObservation = Bank.shared.observe(\.users, options: [.old, .new], changeHandler: { (bank, change) in
            self.accountsTableView.reloadData()
        })
    }
    
    private func configureUserBalanceObservation()  {
        userBalanceObservation = account?.observe(\.balance, options: [.old, .new], changeHandler: { (user, change) in
             self.accountsTableView.reloadData()
                       print("word")
        })
    }
    
}

extension AccountChangeViewController: UITableViewDataSource    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Bank.shared.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath)
        let ccaccount = Bank.shared.users[indexPath.row].account
        cell.textLabel?.text = ccaccount.name
        cell.detailTextLabel?.text = ccaccount.balance.description
        return  cell
    }
}

extension AccountChangeViewController: UITableViewDelegate  {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //account = Bank.shared.users[indexPath.row].account
    }
}
