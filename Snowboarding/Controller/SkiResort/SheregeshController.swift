//
//  SheregeshViewController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 02.05.2023.
//

import UIKit

class SheregeshController: UIViewController {

    private var segmentCo: UISegmentedControl = {
        var segment = UISegmentedControl()
        segment = .init(items: ["О курорте", "Цены", "Режим работы"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    let sheregeshInfo = SheregeshInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        segmentCo.addTarget(self, action: #selector(choiceSegment), for: .valueChanged)
        navigationItem.title = "Шерегеш"
    }
    
    @objc func choiceSegment(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            sheregeshInfo.alpha = 1
            print("1")
        case 1:
            print("1")
            sheregeshInfo.alpha = 0
        case 2:
            print("2")
        default: return
        }
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(segmentCo)
        self.view.addSubview(sheregeshInfo)
 
        self.segmentCo.translatesAutoresizingMaskIntoConstraints = false
        self.sheregeshInfo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.segmentCo.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.segmentCo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.segmentCo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),

            self.sheregeshInfo.topAnchor.constraint(equalTo: segmentCo.bottomAnchor, constant: 10),
            self.sheregeshInfo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.sheregeshInfo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
        ])
    }
}



