//
//  TimeTableViewController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 12.11.2023.
//

import UIKit

class TimeTableViewController: UITableViewController {

    var timeWorkModel: [AllTimeWork] = []
    
    init(timeWorkModel: [AllTimeWork]) {
        self.timeWorkModel = timeWorkModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
        tableView.dataSource = self
        tableView.register(PriceTableViewCell.self, forCellReuseIdentifier: PriceTableViewCell.cellID)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timeWorkModel.count
   }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "PriceCell", for: indexPath) as! PriceTableViewCell
        
        cell.liftNameLabel.text = timeWorkModel[indexPath.row].liftName
        cell.costLabel.text = timeWorkModel[indexPath.row].timeWork

       return cell
   }
}
