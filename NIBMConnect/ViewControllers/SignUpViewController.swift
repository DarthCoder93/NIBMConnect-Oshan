//
//  SignUpViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/16/19.
//  Copyright © 2019 Oshan Madushanka. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var editTextUserName: UITextField!
    @IBOutlet weak var editTextEmail: UITextField!
    @IBOutlet weak var editTextPassword: UITextField!
    @IBOutlet weak var editTextConfirmPassword: UITextField!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblError.text = ""
        signUpButton.layer.cornerRadius = 4
        
    }

    @IBAction func onSignUpClick(_ sender: Any) {
       
        if (validateForm()){
            showProgress()
            signUpUser()
        }
    }
    
    private func signUpUser() {
        Auth.auth().createUser(withEmail: editTextEmail.text!, password: editTextPassword.text!) { authResult, error in
            if let error = error {
                self.lblError.text = error.localizedDescription
                self.hideProgress()
                return
            }
            
        //user signed in successfully. sets the user name to the current user
            self.updateUserName()
        }
    }
    
    private func updateUserName() {
        
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = self.editTextUserName.text
        changeRequest?.commitChanges { (error) in
            if let error = error {
                self.lblError.text = error.localizedDescription
                self.hideProgress()
                return
            }
            
            //update username successfull
            self.hideProgress()
            self.signUpUserDone()
        }
        
    }
    
    func showProgress() {
        self.activityIndicator.startAnimating()
        signUpButton.isEnabled = false
    }
    
    func hideProgress() {
        self.activityIndicator.stopAnimating()
        signUpButton.isEnabled = true
    }
    
    private func signUpUserDone() {
        performSegue(withIdentifier: "signUpToHome", sender: nil)
    }
    
    
    @IBAction func onCloseButtonClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    private func validateForm() -> Bool {
        
        if editTextUserName.text == "" {
            lblError.text = "Please enter a username"
            return false
        }
        if editTextUserName.text?.count ?? 0 < 5 {
            lblError.text = "Username should be at least 6 characters long"
            return false
        }
        if editTextEmail.text == "" || !Tools.isValidEmail(testStr: editTextEmail.text ?? "") {
            lblError.text = "Please enter a valid email"
            return false
        }
        if editTextPassword.text == "" || editTextPassword.text?.count ?? 0 < 6 {
            lblError.text = "Paaword should be at least 6 characters long"
            return false
        }
        if editTextPassword.text != editTextConfirmPassword.text {
            lblError.text = "Passwords doesnot match"
            return false
        }
        
        
        return true
    }
    
}
