//
//  SheregeshInformation.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 10.05.2023.
//

import UIKit

class SheregeshInformation: UIViewController {

    // MARK: - UI Components
    private let aboutResort = CustomLabel(text: "Шерегеш находится на юге Кемеровской области, в Горной Шории — красивой и дикой гористой местности на стыке Саян, Алтая и Кузнецкого Алатау.", textAlignment: .left, size: 20, color: .black, numberOfLines: 10)
    
    private let allTracks = CustomLabel(text: "Всего трасс: 16", textAlignment: .left, size: 20, color: .black)
    private let heightDifference = CustomLabel(text: "Перепад высот: 630 м", textAlignment: .left, size: 20, color: .black)
    private let totalLengthOfTracks = CustomLabel(text: "Общая длина трасс: 35 км", textAlignment: .left, size: 20, color: .black)
    private var imageSheregesh = UIImageView()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.imageSheregesh.image = UIImage(named: "sheregeshLogo")

        self.view.addSubview(imageSheregesh)
        self.view.addSubview(aboutResort)
        self.view.addSubview(allTracks)
        self.view.addSubview(heightDifference)
        self.view.addSubview(totalLengthOfTracks)
        
        imageSheregesh.translatesAutoresizingMaskIntoConstraints = false
        aboutResort.translatesAutoresizingMaskIntoConstraints = false
        allTracks.translatesAutoresizingMaskIntoConstraints = false
        heightDifference.translatesAutoresizingMaskIntoConstraints = false
        totalLengthOfTracks.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.imageSheregesh.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.imageSheregesh.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.imageSheregesh.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.imageSheregesh.heightAnchor.constraint(equalToConstant: 200),
            
            self.aboutResort.topAnchor.constraint(equalTo: imageSheregesh.bottomAnchor, constant: 20),
            self.aboutResort.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.aboutResort.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            self.allTracks.topAnchor.constraint(equalTo: aboutResort.bottomAnchor, constant: 10),
            self.allTracks.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.allTracks.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            self.heightDifference.topAnchor.constraint(equalTo: allTracks.bottomAnchor, constant: 10),
            self.heightDifference.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.heightDifference.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            self.totalLengthOfTracks.topAnchor.constraint(equalTo: heightDifference.bottomAnchor, constant: 10),
            self.totalLengthOfTracks.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.totalLengthOfTracks.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30)
        ])
    }
    
    // MARK: - Selectors
    
    

}
