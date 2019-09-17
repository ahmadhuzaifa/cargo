//
//  SecondRefViewController.swift
//  cargo
//
//  Created by Huzaifa Ahmed on 7/21/19.
//  Copyright © 2019 Huzaifa Ahmad. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SecondRefViewController: UIViewController {

    var email: String?
    var password: String?
    
    @IBOutlet var ssnTF: UITextField!
    @IBOutlet var fullName: UITextField!
    @IBOutlet var fullAddressTf: UITextField!
    @IBOutlet var licenseNoTF: UITextField!
    @IBOutlet var birthdate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
 
    @IBAction func handleRegister(_ sender: Any) {
        startLoading()
        // Add the authentication code here... and then call endLoading()
        Auth.auth().createUser(withEmail: email!, password: password!, completion: { (result, error) in
            self.endLoading()
            if error != nil{
                print(error!)
            }
            else{
              let uid = Auth.auth().currentUser?.uid
              let db = Firestore.firestore().collection("users").document(uid!)
              db.setData(["name": self.fullName.text!,
                            "address": self.fullAddressTf.text!,
                            "licenseNo": self.licenseNoTF.text!,
                            "SSN": self.ssnTF.text!])
                self.navigationController!.popToRootViewController(animated: true)
            }
        })
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
