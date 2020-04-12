//
//  AccountChangeViewController.swift
//  KVO-Lab
//
//  Created by Juan Ceballos on 4/8/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class AccountChangeViewController: UIViewController {

    var users = [User]()    {
        didSet  {
            accountsTableView.reloadData()
        }
    }
    
    @IBOutlet weak var accountsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountsTableView.dataSource = self
        accountsTableView.delegate = self
    }
    
}

extension AccountChangeViewController: UITableViewDataSource    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath)
        return cell
    }
}

extension AccountChangeViewController: UITableViewDelegate  {
    
}
