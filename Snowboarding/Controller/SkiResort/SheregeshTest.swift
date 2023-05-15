//
//  SheregeshTest.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 15.05.2023.
//

import UIKit

class SheregeshTest: UIViewController, UIScrollViewDelegate {

    private var segmentCo: UISegmentedControl = {
        var segment = UISegmentedControl()
        segment = .init(items: ["О курорте", "Цены", "Режим работы"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private var scrollView  UIScrollView()

    
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
        self.view.addSubview(scrollView)
        scrollView.addSubview(segmentCo)
        scrollView.addSubview(sheregeshInfo)
        scrollView.delegate = self
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.segmentCo.translatesAutoresizingMaskIntoConstraints = false
        self.sheregeshInfo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate ([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10),
            
            self.segmentCo.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.segmentCo.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.segmentCo.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.segmentCo.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.segmentCo.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            
            self.sheregeshInfo.topAnchor.constraint(equalTo: self.segmentCo.topAnchor),
            self.sheregeshInfo.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.sheregeshInfo.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.sheregeshInfo.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.sheregeshInfo.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            
            //sheregeshInfo.bottomAnchor.constraint(equalTo: self.segmentCo.bottomAnchor, constant: -200)
            
        ])
    }

}
