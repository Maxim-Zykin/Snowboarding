//
//  TimeTableViewTest.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 25.10.2024.
//

import UIKit

class TimeTableViewTest: UITableViewController {

    var timeWorkModel = [String]()
    
    init(timeWorkModel: [String]) {
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
        
        cell.liftNameLabel.text = timeWorkModel[indexPath.row]

       return cell
   }
}
