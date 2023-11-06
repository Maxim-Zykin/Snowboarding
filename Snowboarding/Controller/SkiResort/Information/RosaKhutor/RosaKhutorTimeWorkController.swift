//
//  RosaKhutorTimeWorkController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 02.06.2023.
//

import UIKit

class RosaKhutorTimeWorkController: UIViewController {
    
    let timeWorkModel = RosaKhutorTimeWorkGroup.skiShow()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TimeWorkTableViewCell.self, forCellReuseIdentifier: TimeWorkTableViewCell.cellID)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
        tableView.dataSource = self
        view.addSubview(tableView)
    }

    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
}

extension RosaKhutorTimeWorkController: UITableViewDataSource {
    
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
