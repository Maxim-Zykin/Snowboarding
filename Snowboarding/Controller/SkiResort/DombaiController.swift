//
//  DombaiController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 08.05.2023.
//

import UIKit

class DombaiController: UIViewController {

    private var segmentCo: UISegmentedControl = {
        var segment = UISegmentedControl()
        segment = .init(items: ["О курорте", "Цены", "Режим работы"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private let dombaiInfo = DombaiInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        segmentCo.addTarget(self, action: #selector(choiceSegment), for: .valueChanged)
        navigationItem.title = "Домбай"
    }
    
    @objc func choiceSegment(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            dombaiInfo.alpha = 1
            print("1")
        case 1:
            dombaiInfo.alpha = 0
            print("1")
        case 2:
            dombaiInfo.alpha = 0
            print("2")
        default: return
        }
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(segmentCo)
        self.view.addSubview(dombaiInfo)
 
        self.segmentCo.translatesAutoresizingMaskIntoConstraints = false
        self.dombaiInfo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.segmentCo.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.segmentCo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.segmentCo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            
            self.dombaiInfo.topAnchor.constraint(equalTo: segmentCo.bottomAnchor, constant: 10),
            self.dombaiInfo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.dombaiInfo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)
        ])
    }
}
