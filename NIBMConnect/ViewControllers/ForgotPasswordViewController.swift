//
//  ForgotPasswordViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/16/19.
//  Copyright © 2019 Oshan Madushanka. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var editTextEmail: UITextField!
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var lblError: UILabel!
    
    private lazy var currentUser: User? = {
        return Auth.auth().currentUser
    }()

    private var isEmailVarified = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func onResetButtonClick(_ sender: Any) {
        
        
        let email = editTextEmail.text
        
        Auth.auth().currentUser?.updateEmail(to: email!) { (error) in
            
            if error == nil {
                self.lblError.text = error?.localizedDescription
                return
            }
            
            self.alert(message: "Password reset mail sent", title: "Alert", callback: {
                self.passwordRestDone()
            })
            
            
        }
       
    }
    
    @IBAction func onCloseClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    
    private func passwordRestDone()  {
         self.dismiss(animated: true)
    }
    
}
