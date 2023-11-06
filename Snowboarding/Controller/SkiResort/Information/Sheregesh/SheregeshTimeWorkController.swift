//
//  SheregeshTimeWorkController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 01.06.2023.
//

import UIKit

class SheregeshTimeWorkController: UIViewController {

    let timeWorkModel = SheregeshTimeWorkGroup.skiShow()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TimeWorkTableViewCell.self, forCellReuseIdentifier: TimeWorkTableViewCell.cellID)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
}


    // MARK: - Table view data source
extension SheregeshTimeWorkController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         timeWorkModel.sky.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeWorkCell", for: indexPath) as! TimeWorkTableViewCell

         cell.liftNameLabel.text = timeWorkModel.sky[indexPath.row].liftName
         cell.timeWork.text = timeWorkModel.sky[indexPath.row].timeWork

        return cell
    }
}
