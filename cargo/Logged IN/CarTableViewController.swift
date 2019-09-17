//
//  CarTableViewController.swift
//  cargo
//
//  Created by Huzaifa Ahmed on 7/21/19.
//  Copyright © 2019 Huzaifa Ahmad. All rights reserved.
//

import UIKit
import FirebaseFirestore

class CarTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))

    }
    func handleDatabase(){
        
    }
    @objc func add(){
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
