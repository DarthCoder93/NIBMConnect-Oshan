//
//  MyProfileViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/21/19.
//  Copyright © 2019 Oshan Madushanka. All rights reserved.
//

import UIKit
import LocalAuthentication

class MyProfileViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var containerStackView: UIStackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Profile"
        
        //make imageview round
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        
        userImageView.isHidden = true
        userImageView.alpha = 0
        
        containerStackView.isHidden = true
        userImageView.alpha = 0
        
        authenticateUser()
        
        
    }
    
    @IBAction func onFBUrlClick(_ sender: Any) {
       
            UIApplication.tryURL(urls: ["https://www.facebook.com/oshan.madusanka"])
        
        
    }
    
    
    func authenticateUser(){
        let authContext = LAContext()
        let authReason = "Please use Touch ID to access Your Account Data"
        var authError : NSError?
        
        if authContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &authError){
            
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: authReason, reply: { (success,error) -> Void in
                if success{
                    //Go to My Account Page
                    DispatchQueue.main.async {
                         self.showUserData()
                    }
                }
                
                if error != nil{
                    let errMessage = error?.localizedDescription
                    
                    if (errMessage != nil) {
                        self.alert(message: errMessage!, title: "Error", callback: {
                            self.navigationController?.popViewController(animated: true)
                        })
                    } else {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
                
            })
            
        } else{
            self.alert(message: "Authentication Failed", callback: {
                self.navigationController?.popViewController(animated: true)
            })
        }
    }
    
  
    
    
//    func authenticateUser() {
//        let myContext = LAContext()
//        let myLocalizedReasonString = "Biomatric authentication needs to be provided to view this page"
//
//        var authError: NSError?
//        if #available(iOS 8.0, macOS 10.12.1, *) {
//            if myContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
//                myContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: myLocalizedReasonString) { success, evaluateError in
//
//                    DispatchQueue.main.async {
//                        if success {
//                            // User authenticated successfully, take appropriate action
//                            self.showUserData()
//
//                        } else {
//
//                            let err = evaluateError?.localizedDescription
//
//                            if (err != nil) {
//                                self.alert(message: err!, title: "Error", callback: {
//                                    self.navigationController?.popViewController(animated: true)
//                                })
//                            }
//
//                        }
//                    }
//                }
//            } else {
//                self.alert(message: "Authentication Failed", callback: {
//                     self.navigationController?.popViewController(animated: true)
//                })
//            }
//        } else {
//            self.alert(message: "Authentication Failed", callback: {
//                self.navigationController?.popViewController(animated: true)
//            })
//        }
//    }
    
    
    private func showUserData() {
        UIView.animate(withDuration: 0.8,
                       delay: 0.2,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: { () -> Void in
                       
                        self.userImageView.isHidden = false
                        self.userImageView.alpha = 1
                        
                        self.containerStackView.isHidden = false
                        self.containerStackView.alpha = 1
                        
        })
    }
    
    

}
