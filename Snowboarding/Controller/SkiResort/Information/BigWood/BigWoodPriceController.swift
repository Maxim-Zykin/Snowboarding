//
//  BigWoodPriceController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 03.11.2023.
//

import UIKit

class BigWoodPriceController: UIViewController {

    let costModel = BigWoodPriceGroup.skiShow()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 80
        tableView.register(PriceTableViewCell.self, forCellReuseIdentifier: PriceTableViewCell.cellID)
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

extension BigWoodPriceController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        costModel.sky.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PriceCell", for: indexPath) as! PriceTableViewCell
        
        cell.liftNameLabel.text = costModel.sky[indexPath.row].liftName
        cell.costLabel.text = costModel.sky[indexPath.row].cost
        return cell
    }
    

}
