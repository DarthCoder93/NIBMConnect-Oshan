//
//  SignInViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/16/19.
//  Copyright © 2019 Oshan Madushanka. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var editextEmail: UITextField!
    @IBOutlet weak var editTextPassword: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var lblErrorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLayout()
        
        GIDSignIn.sharedInstance().uiDelegate = self
       // GIDSignIn.sharedInstance().signIn()
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
       
        if let error = error {
            lblErrorMessage.text = error.localizedDescription
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                self.lblErrorMessage.text = error.localizedDescription
                return
            }
            self.userSignedIn()
        }
        
    }
    
    @IBAction func onSignInClick(_ sender: Any) {
        
        if validateForm() {
            Auth.auth().signIn(withEmail: editextEmail.text!, password: editTextPassword.text!) { [weak self] user, error in
                guard let strongSelf = self else { return }
                
                if (error != nil){
                    strongSelf.lblErrorMessage.text = error?.localizedDescription
                } else {
                    strongSelf.userSignedIn()
                }
                
            }
        }
        
    }
    
    @IBAction func onForgotPasswordClick(_ sender: Any) {
        performSegue(withIdentifier: "forgotPasswordSegue", sender: nil)
    }
    
    
    func validateForm() -> Bool {
        
        if (editextEmail.text == "" || !Tools.isValidEmail(testStr: editextEmail.text ?? "")) {
            lblErrorMessage.text = "Please enter a valid email address"
            return false
        }
        
        if (editTextPassword.text == ""){
            lblErrorMessage.text = "Please enter a password"
            return false
        }
        
        return true
    }
    
    
    func userSignedIn() {
        performSegue(withIdentifier: "signInToHomeSegue", sender: nil)
    }
    
    
    func setUpLayout() {
        
        //set left view icon for email Text Field
        let emailIconImageView = UIImageView(frame: CGRect(x: 8.0, y: 8.0, width: 24.0, height: 24.0))
        let emailIcon = UIImage(named: "icon_email")
        emailIconImageView.image = emailIcon
        emailIconImageView.contentMode = .scaleAspectFit
        emailIconImageView.image = emailIconImageView.image?.withRenderingMode(.alwaysTemplate)
        emailIconImageView.tintColor = UIColor.init(rgb: 0xf5f5f5)
        
        let emailIconView = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 40))
        emailIconView.addSubview(emailIconImageView)
        editextEmail.leftViewMode = UITextField.ViewMode.always
        editextEmail.leftView = emailIconView
        
        //set left view icon for password Text Field
        let passwordIconImageView = UIImageView(frame: CGRect(x: 8.0, y: 8.0, width: 24.0, height: 24.0))
        let passwordIcon = UIImage(named: "icon_password")
        passwordIconImageView.image = passwordIcon
        passwordIconImageView.contentMode = .scaleAspectFit
        passwordIconImageView.image = passwordIconImageView.image?.withRenderingMode(.alwaysTemplate)
        passwordIconImageView.tintColor = UIColor.init(rgb: 0xf5f5f5)
        
        let passwordIconView = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 40))
        passwordIconView.addSubview(passwordIconImageView)
        editTextPassword.leftViewMode = UITextField.ViewMode.always
        editTextPassword.leftView = passwordIconView
        
        //set sign in button corner radius
        signInButton.layer.cornerRadius = 4
        signUpButton.layer.cornerRadius = 4
        
        lblErrorMessage.text = ""
    }
    
    @IBAction func onSignUpClick(_ sender: Any) {
        performSegue(withIdentifier: "signInToSignUpSegue", sender: nil)
    }
    
}


