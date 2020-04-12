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
    
    private var user: User?
    private var bankObservation: NSKeyValueObservation?
    
    private var userBalanceObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountsTableView.dataSource = self
        accountsTableView.delegate = self
        //configureBankObservation()
        //configureUserBalanceObservation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        accountsTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let accountActionVC = segue.destination as? AccountActionViewController, let indexPath = accountsTableView.indexPathForSelectedRow else {
             fatalError("could not segue")
           }
        let user = Bank.shared.users[indexPath.row]
        accountActionVC.user = user
    }
    
    private func configureBankObservation() {
        bankObservation = Bank.shared.observe(\.users, options: [.old, .new], changeHandler: { (bank, change) in
            self.accountsTableView.reloadData()
        })
    }
    
    private func configureUserBalanceObservation()  {
        userBalanceObservation = user?.observe(\.balance, options: [.old, .new], changeHandler: { (user, change) in
            self.accountsTableView.reloadData()
        })
    }
    
}

extension AccountChangeViewController: UITableViewDataSource    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Bank.shared.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath)
        let user = Bank.shared.users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.balance.description
        return  cell
    }
}

extension AccountChangeViewController: UITableViewDelegate  {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
