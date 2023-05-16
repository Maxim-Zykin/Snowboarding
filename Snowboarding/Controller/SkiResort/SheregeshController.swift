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
    
    private var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = true
        view.isDirectionalLockEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
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
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.scrollView.addSubview(segmentCo)
        self.scrollView.addSubview(sheregeshInfo)
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.segmentCo.translatesAutoresizingMaskIntoConstraints = false
        self.sheregeshInfo.translatesAutoresizingMaskIntoConstraints = false

        let hCont = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hCont.isActive = true
        hCont.priority = .defaultLow
        
        
        NSLayoutConstraint.activate ([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.contentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, constant: 430),
            
            segmentCo.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            segmentCo.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            segmentCo.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            segmentCo.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),

            sheregeshInfo.topAnchor.constraint(equalTo: self.segmentCo.bottomAnchor),
            sheregeshInfo.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            sheregeshInfo.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            //sheregeshInfo.bottomAnchor.constraint(equalTo: self.segmentCo.bottomAnchor, constant: -200)
            
        ])
    }
}



