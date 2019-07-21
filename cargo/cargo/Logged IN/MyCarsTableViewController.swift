//
//  MyCarsTableViewController.swift
//  cargo
//
//  Created by Huzaifa Ahmed on 7/21/19.
//  Copyright © 2019 Huzaifa Ahmad. All rights reserved.
//

import UIKit
import SmartcarAuth
import SafariServices

class MyCarsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0

    }
    let appDelegate1 = UIApplication.shared.delegate as! AppDelegate


    @IBAction func signIn(_ sender: Any) {
        appDelegate1.smartcarSdk = SmartcarAuth(
            clientId: "65b7acd2-6827-4876-b5e7-9710d93d312d",
            redirectUri: "sc65b7acd2-6827-4876-b5e7-9710d93d312d://page",
            scope: ["read_vin", "read_vehicle_info", "read_odometer"],
            completion: { (error, code, state) -> Any? in
                if error != nil{
                    print(error!)
                }
        
                return code
        })
        appDelegate1.smartcarSdk?.launchAuthFlow(viewController: self)
    }

    
 
}
