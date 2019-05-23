//
//  FriendTableViewCell.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/20/19.
//  Copyright © 2019 Oshan Madushanka. All rights reserved.
//

import UIKit
import Nuke

class FriendTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 8
        friendImageView.layer.cornerRadius = 25
        
    }
    


    
    func setUpData(friend: Friend)  {
        lblName.text = friend.firstName
        if friend.imageUrl != nil {
            Nuke.loadImage(with: URL(string: friend.imageUrl!)!, into: self.friendImageView)
            
            
       
        }
    }

}
