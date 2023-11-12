//
//  PriceTableViewController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 12.11.2023.
//

import UIKit

class PriceTableViewController: UITableViewController {

    var costModel: [AllPrice] = []
    
    init(costModel: [AllPrice]) {
        self.costModel = costModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        tableView.dataSource = self
        tableView.register(PriceTableViewCell.self, forCellReuseIdentifier: PriceTableViewCell.cellID)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        costModel.count
   }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "PriceCell", for: indexPath) as! PriceTableViewCell
        
        cell.liftNameLabel.text = costModel[indexPath.row].liftName
        cell.costLabel.text = costModel[indexPath.row].cost

       return cell
   }
}
