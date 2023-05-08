//
//  ArhyzController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 08.05.2023.
//

import UIKit

class ArhyzController: UIViewController {

    let segment = ResortInformationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationItem.title = "Архыз"
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(segment)
        self.segment.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.segment.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.segment.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.segment.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
        ])
    }
}
