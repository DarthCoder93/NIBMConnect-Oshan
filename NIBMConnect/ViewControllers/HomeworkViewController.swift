//
//  HomeworkViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/21/19.
//  Copyright © 2019 Oshan Madushanka. All rights reserved.
//

import UIKit

class HomeworkViewController: UIViewController {
    
    private var homeworkArray: [HomeWorkModel] = []

    @IBOutlet weak var homeWorkTableView: UITableView!
    
    private let cellIdentifier = "HomeWorkTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Homework"
        addNavigationBarButton()
        
        homeWorkTableView.dataSource = self
        homeWorkTableView.delegate = self
        homeWorkTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let homeworkDefaultList = UserDefaults.standard.decode(for: [HomeWorkModel].self, using: String(describing: HomeWorkModel.self))
        
        homeworkArray.removeAll()
        
        homeworkArray = homeworkDefaultList ?? []
        
        homeWorkTableView.reloadData()
        
    }
    
    

    private func addNavigationBarButton(){
        var image = UIImage(named: "plus")
        image = image?.withRenderingMode(.alwaysOriginal)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(addHomeWork))
        
    }
    
    @objc public func addHomeWork() {
        performSegue(withIdentifier: "addHomeworkSegue", sender: nil)
    }
  
}

extension HomeworkViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeWorkTableViewCell
        
        cell.setUpData(homework: homeworkArray[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
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
