//
//  RosaKhutorController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 08.05.2023.
//

import UIKit

class RosaKhutorController: UIViewController {

    private var segmentCo: UISegmentedControl = {
        var segment = UISegmentedControl()
        segment = .init(items: ["О курорте", "Цены", "Режим работы"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private let rosaKhutorInfo = RosaKhutorInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        segmentCo.addTarget(self, action: #selector(choiceSegment), for: .valueChanged)
        navigationItem.title = "Роза Хутор"
    }
    
    @objc func choiceSegment(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            rosaKhutorInfo.alpha = 1
            print("1")
        case 1:
            rosaKhutorInfo.alpha = 0
            print("1")
        case 2:
            rosaKhutorInfo.alpha = 0
            print("2")
        default: return
        }
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(segmentCo)
        self.view.addSubview(rosaKhutorInfo)
 
        self.segmentCo.translatesAutoresizingMaskIntoConstraints = false
        self.rosaKhutorInfo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.segmentCo.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            self.segmentCo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.segmentCo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),

            self.rosaKhutorInfo.topAnchor.constraint(equalTo: segmentCo.bottomAnchor, constant: 10),
            self.rosaKhutorInfo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.rosaKhutorInfo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)
        ])
    }
}
