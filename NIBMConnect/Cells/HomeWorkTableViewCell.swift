//
//  HomeWorkTableViewCell.swift
//  NIBMConnect
//
//  Created by Oshan on 5/26/19.
//  Copyright © 2019 Oshan Madushanka. All rights reserved.
//

import UIKit

class HomeWorkTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addedDateLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpData(homework: HomeWorkModel)  {
        titleLabel.text = homework.title
        descriptionLabel.text = homework.description
        
        let dateformatter = DateFormatter()
        
        dateformatter.dateStyle = DateFormatter.Style.short
        
        dateformatter.timeStyle = DateFormatter.Style.short
        
        let addedTime = dateformatter.string(from: homework.timeAdded)
        
        addedDateLabel.text = addedTime
        
        if homework.submissionDate != nil {
        
            let deadLineDate = dateformatter.string(from: homework.submissionDate!)
        
            deadlineLabel.text = deadLineDate
            
        }
        
    }

}
