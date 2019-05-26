//
//  FriendDetailsViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/21/19.
//  Copyright © 2019 Oshan Madushanka. All rights reserved.
//

import UIKit
import Nuke

class FriendDetailsViewController: UIViewController {
    
    var friend: Friend? = nil
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var facebookUrl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if friend != nil {
            
            if friend?.imageUrl != nil || friend?.imageUrl != "" {
                Nuke.loadImage(with: URL(string: (friend?.imageUrl!)!)!, into: friendImageView)
            }
            
            fullName.text = "\(friend?.firstName ?? "") \(friend?.lastName ?? "")"
            
            city.text = friend?.city
            
            birthday.text = friend?.birthday
            
            gender.text = friend?.city
            
            phoneNumber.text = friend?.phoneNumber
            
            facebookUrl.text = friend?.facebookUrl
            
            
            
            
        }
        

    }

    @IBAction func onFBLinkClick(_ sender: Any) {
        
        if friend?.facebookUrl != nil || friend?.facebookUrl != "" {
            UIApplication.tryURL(urls: [friend?.facebookUrl! ?? ""])
        }
        
    }
    
}
