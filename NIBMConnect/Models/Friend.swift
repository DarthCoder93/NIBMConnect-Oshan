//
//  Friend.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/20/19.
//  Copyright © 2019 Oshan Madushanka. All rights reserved.
//

import Foundation

class Friend {
    
    var firstName: String
    var lastName: String
    var city: String?
    var imageUrl: String?
    var birthday: String?
    var gender: String?
    var phoneNumber: String?
    var facebookUrl: String?
    
    init(firstName: String,
         lastName: String,
         city: String?,
         imageUrl: String?,
         birthday: String?,
         gender: String?,
         phoneNumber: String?,
         fbUrl: String?) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.city = city
        self.imageUrl = imageUrl
        self.birthday = birthday
        self.gender = gender
        self.phoneNumber = phoneNumber
        self.facebookUrl = fbUrl
    }
    
    
}
