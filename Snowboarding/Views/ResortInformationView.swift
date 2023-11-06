//
//  ResortInformationView.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 23.04.2023.
//

import UIKit

class ResortInformationView: UIView {
       
    private let menuResort = ["О курорте", "Цены", "Режим работы"]
    
    private var segmentCo: UISegmentedControl = {
        var segment = UISegmentedControl()
        segment = .init(items: ["О курорте", "Цены", "Режим работы"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        segmentCo.addTarget(self, action: #selector(choiceSegment), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func choiceSegment(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("0")
        case 1:
            print("1")
        case 2:
            print("2")
        default: return
        }
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.addSubview(segmentCo)
        self.segmentCo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.segmentCo.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            self.segmentCo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.segmentCo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
        ])
    }
}

/*
 Перенести из контроллера сюда.
 это вью использовать в каждом курорте, где подставлять данные о выбранном курорте
 добавить перечесление курорта, ссылки на описание каждого курорта цены и режим работы
 */
