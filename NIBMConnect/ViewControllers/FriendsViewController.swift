//
//  FriendsViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/20/19.
//  Copyright © 2019 Oshan Madushanka. All rights reserved.
//

import UIKit
import Firebase

class FriendsViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var tableview: UITableView!
    private var friendsList: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Friends"
        
        ref = Database.database().reference()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        tableview.separatorStyle = .none
        
        retriveFriendsFromFirebase()
    
    }
    
    func retriveFriendsFromFirebase() {
        

        
        var freindsRef = ref.child("friends")
        
        
        freindsRef.observe(.value) { snapshot in
            for student in snapshot.children.allObjects as! [DataSnapshot] {
                let friendObject = student.value as? [String:AnyObject]

                let friend = Friend(firstName: friendObject!["first_name"] as! String,
                                    lastName: friendObject!["last_name"] as! String,
                                    city: friendObject!["city"] as? String,
                                    imageUrl: friendObject!["imageUrl"] as? String,
                                    birthday: friendObject!["birthday"] as? String,
                                    gender: friendObject!["gender"] as? String,
                                    phoneNumber: friendObject!["phoneNumber"] as? String,
                                    fbUrl: friendObject!["facebookUrl"] as? String
                                    )

                self.friendsList.append(friend)
            }
            
            
            self.tableview.reloadData()
        }
    }
    

}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as! FriendTableViewCell
        
        cell.selectionStyle = .none
        
        cell.setUpData(friend: friendsList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "friendDetails", sender: friendsList[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "friendDetails"{
            if let nextViewController = segue.destination as? FriendDetailsViewController {
                nextViewController.friend = sender as? Friend
            }
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        
        UIView.animate(
            withDuration: 0.7,
            delay: 0.07 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }
    
}
