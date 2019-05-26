//
//  HomeWork.swift
//  NIBMConnect
//
//  Created by Oshan on 5/26/19.
//  Copyright © 2019 Oshan Madushanka. All rights reserved.
//

import Foundation


struct HomeWorkModel: Codable {

    var title: String
    var description: String
    var timeAdded: Date
    var submissionDate: Date?
    
    
    init(title: String, description: String, timeAdded: Date, submissionDate: Date?) {
        self.title = title
        self.description = description
        self.timeAdded = timeAdded
        self.submissionDate = submissionDate
    }
    
    
    
}
