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
    @IBOutlet weak var editTextPassword: UITextField!
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var lblError: UILabel!
    
    private lazy var currentUser: User? = {
        return Auth.auth().currentUser
    }()

    private var isEmailVarified = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editTextPassword.isHidden = true
        editTextPassword.alpha = 0.3
        buttonReset.titleLabel?.text = "Done"

    }
    
    @IBAction func onResetButtonClick(_ sender: Any) {
        
        if !isEmailVarified {
            //checks weather user entered email is equal to the loged in users email
            if editTextEmail.text == currentUser?.email {
                //disable email textfield
                editTextEmail.isEnabled = false
                //animate and show the password field
                UIView.animate(withDuration: 1.0, delay: 1.2, options: .curveEaseOut, animations: {
                    self.editTextPassword.isHidden = false
                    self.editTextPassword.alpha = 1
                }, completion: { finished in
                    self.buttonReset.titleLabel?.text = "Reset Pasword"
                })
            } else {
                lblError.text = "Email does not match"
            }
        } else {
            if editTextPassword.text != "" {
                buttonReset.alpha = 0.6
                buttonReset.isEnabled = false
                //reset password
                Auth.auth().currentUser?.updatePassword(to: editTextPassword.text!) { (error) in
                    if let error = error {
                        self.lblError.text = error.localizedDescription
                        return
                    }
                    
                    self.lblError.textColor = UIColor.green
                    self.lblError.text = "Password Rest successfully"
                    //animate the lable to indicate success and go back
                    UIView.animate(withDuration: 0.5, animations: {() -> Void in
                        self.lblError.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                    }, completion: {(_ finished: Bool) -> Void in
                        UIView.animate(withDuration: 0.5, animations: {() -> Void in
                            self.lblError.transform = CGAffineTransform(scaleX: 1, y: 1)
                        }, completion: {(_ finished: Bool) -> Void in
                            self.passwordRestDone()
                        })
                    })
                    
                }
            } else {
                 self.lblError.text = "Please enter your new password"
            }
        }
      
    }
    
    private func passwordRestDone()  {
        navigationController?.popViewController(animated: true)
    }
    
}
