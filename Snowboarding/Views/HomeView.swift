//
//  HomeView.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 28.03.2023.
//

import UIKit

class HomeView: UIView {

    // MARK: - UI Components
    private let skiResort: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    // MARK: - LifeCycle
    init(skiResort: String){
        super.init(frame: .zero)
        self.skiResort.text = skiResort
        //self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
//    private func setupUI() {
//        self.addSubview(titleLabel)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
//            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
//            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
//
//        ])
//    }
    
    
    // MARK: - Selectors
    
    
}
