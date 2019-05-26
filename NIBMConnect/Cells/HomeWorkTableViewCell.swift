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
        deadlineLabel.text = homework.description
    }

}
