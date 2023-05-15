//
//  ArhyzController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 08.05.2023.
//

import UIKit

class ArhyzController: UIViewController {

    private var segmentCo: UISegmentedControl = {
        var segment = UISegmentedControl()
        segment = .init(items: ["О курорте", "Цены", "Режим работы"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private var arhyzInfo = ArhyzInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        segmentCo.addTarget(self, action: #selector(choiceSegment), for: .valueChanged)
        navigationItem.title = "Архыз"
    }
    
    @objc func choiceSegment(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            arhyzInfo.alpha = 1
            print("0")
        case 1:
            arhyzInfo.alpha = 0
            print("1")
        case 2:
            arhyzInfo.alpha = 0
            print("2")
        default: return
        }
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(segmentCo)
        self.view.addSubview(arhyzInfo)
 
        self.segmentCo.translatesAutoresizingMaskIntoConstraints = false
        self.arhyzInfo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.segmentCo.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.segmentCo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.segmentCo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),

            self.arhyzInfo.topAnchor.constraint(equalTo: segmentCo.bottomAnchor, constant: 10),
            self.arhyzInfo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.arhyzInfo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)
        ])
    }
}
