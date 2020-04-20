//
//  UsersViewController.swift
//  KVO-Lab
//
//  Created by Juan Ceballos on 4/8/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    
    var bankObservation: NSKeyValueObservation?
    var account: Account?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView.dataSource = self
        configureBankObservation()
    }
    
    private func configureBankObservation() {
        bankObservation = Bank.shared.observe(\.users, options: [.old, .new], changeHandler: { (bank, change) in
            self.usersTableView.reloadData()
        })
    }
    
}

extension UsersViewController: UITableViewDataSource   {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Bank.shared.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let ccaccount = Bank.shared.users[indexPath.row].account
        cell.textLabel?.text = ccaccount.name
        cell.detailTextLabel?.text = ccaccount.balance.description
        return cell
    }
    
}
