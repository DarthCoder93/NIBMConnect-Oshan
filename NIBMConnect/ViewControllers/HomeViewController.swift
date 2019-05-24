//
//  HomeViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/16/19.
//  Copyright © 2019 Oshan Madushanka. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var friendsView: UIView!
    @IBOutlet weak var friendsImageView: UIImageView!
    @IBOutlet weak var homeworkView: UIView!
    @IBOutlet weak var homeworkImageview: UIImageView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = .black
        title = "Home"
        
        friendsView.layer.cornerRadius = 8
        friendsImageView.layer.cornerRadius = 8
        homeworkView.layer.cornerRadius = 8
        homeworkImageview.layer.cornerRadius = 8
        profileView.layer.cornerRadius = 8
        profileImageView.layer.cornerRadius = 8

    }
    
    @IBAction func friendsClick(_ sender: Any) {
        performSegue(withIdentifier: "hoemToFriendsSegue", sender: nil)
    }
    
    @IBAction func homeworkClick(_ sender: Any) {
        performSegue(withIdentifier: "homeworkSegue", sender: nil)
    }
    
    @IBAction func myProfileClick(_ sender: Any) {
        performSegue(withIdentifier: "profieSegue", sender: nil)
    }
    
    @IBAction func signOutButtonClick(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signInVC") as UIViewController
        self.present(viewController, animated: false, completion: nil)
        
        
        //performSegue(withIdentifier: "signOutSegue", sender: nil)
        
    }
    

    
    
}
