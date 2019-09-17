//
//  RegisterViewController.swift
//  cargo
//
//  Created by Huzaifa Ahmed on 7/21/19.
//  Copyright © 2019 Huzaifa Ahmad. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SecondRefViewController{
            vc.email = emailTextField.text
            vc.password = passwordTextField.text
        }
    }
    
   
}
