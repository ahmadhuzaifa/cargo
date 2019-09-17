//
//  SecondRegViewController.swift
//  cargo
//
//  Created by Huzaifa Ahmed on 7/21/19.
//  Copyright © 2019 Huzaifa Ahmad. All rights reserved.
//

import UIKit

class SecondRegViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func handleLogin(_ sender: Any) {
        startLoading()
        // Add the authentication code here... and then call endLoading()
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
            if error != nil{
                print(error!)
            }
            else{
                let db = FireS
                
                let storyboard = UIStoryboard(name: "LoggedIn", bundle: nil)
                let mainController = storyboard.instantiateViewController(withIdentifier: "mainTabBar")
                self.present(mainController, animated: true, completion: nil)
                
            }
        }
        
    }
    
    func startLoading(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    func endLoading(){
        let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
        notificationFeedbackGenerator.notificationOccurred(.success)
        dismiss(animated: false, completion: nil)
    }
}
