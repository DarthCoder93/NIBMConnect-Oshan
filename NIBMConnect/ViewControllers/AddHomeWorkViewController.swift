//
//  AddHomeWorkViewController.swift
//  NIBMConnect
//
//  Created by Oshan on 5/26/19.
//  Copyright © 2019 Oshan Madushanka. All rights reserved.
//

import UIKit

class AddHomeWorkViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var submissionDatePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    private var isDateSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add Homework"
        
        addNavigationBarButton()
        
        
        
        
    }
    
    private func addNavigationBarButton(){
        var image = UIImage(named: "done")
        image = image?.withRenderingMode(.alwaysOriginal)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(addHomeWork))
        
    }

    @objc public func addHomeWork() {
        
        if titleTextField.text == "" {
            alert(message: "Please add a title", title: "Warning")
            return
        }
        
        if descriptionTextField.text == "" {
            alert(message: "Please add a description", title: "Warning")
            return
        }
        
        var submissionDate: Date? = nil
        
        if isDateSelected {
            submissionDate = submissionDatePicker.date
        }
        
        let homework = HomeWorkModel(title: titleTextField.text!, description: descriptionTextField.text!, timeAdded: Date(), submissionDate: submissionDate)
        
        var savedHomeworkArray = UserDefaults.standard.decode(for: [HomeWorkModel].self, using: String(describing: HomeWorkModel.self))
        
        
        if (savedHomeworkArray == nil) {
            UserDefaults.standard.encode(for:[homework], using: String(describing: HomeWorkModel.self))
        } else {
            savedHomeworkArray?.append(homework)
            UserDefaults.standard.encode(for:savedHomeworkArray, using: String(describing: HomeWorkModel.self))
        }
        
        navigationController?.popViewController(animated: true)
        
        
    }
    
    @IBAction func selectedDateChanged(_ sender: Any) {
        
        isDateSelected = true
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let strDate = dateFormatter.string(from: submissionDatePicker.date)
        dateLabel.text = strDate
        
    }
    
    
}
