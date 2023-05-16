//
//  RosaKhutorInfo.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 14.05.2023.
//

import UIKit

class RosaKhutorInfo: UIView {

    // MARK: - Variables
    private let imageRosaKhutor = UIImageView()
    private let aboutResort = CustomLabel(text: "Роза Хутор — круглогодичный горный курорт, расположенный на берегах реки Мзымта и горных склонах к югу от неё в Адлерском районе Сочи.",  textAlignment: .left, size: 20, color: .black, numberOfLines: 20)
    
    private let allTracks = CustomLabel(text: "Всего трасс: 72", textAlignment: .left, size: 20, color: .black)
    private let heightDifference = CustomLabel(text: "Перепад высот: 1569 м", textAlignment: .left, size: 20, color: .black)
    private let totalLengthOfTracks = CustomLabel(text: "Общая длина трасс: 106 км", textAlignment: .left, size: 20, color: .black)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.backgroundColor = .systemBackground
        self.imageRosaKhutor.image = UIImage(named: "rosakhutorLogo")

        self.addSubview(imageRosaKhutor)
        self.addSubview(aboutResort)
        self.addSubview(allTracks)
        self.addSubview(heightDifference)
        self.addSubview(totalLengthOfTracks)
        
        imageRosaKhutor.translatesAutoresizingMaskIntoConstraints = false
        aboutResort.translatesAutoresizingMaskIntoConstraints = false
        allTracks.translatesAutoresizingMaskIntoConstraints = false
        heightDifference.translatesAutoresizingMaskIntoConstraints = false
        totalLengthOfTracks.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.imageRosaKhutor.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            self.imageRosaKhutor.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageRosaKhutor.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageRosaKhutor.heightAnchor.constraint(equalToConstant: 200),
            
            self.aboutResort.topAnchor.constraint(equalTo: imageRosaKhutor.bottomAnchor, constant: 20),
            self.aboutResort.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.aboutResort.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            
            self.allTracks.topAnchor.constraint(equalTo: aboutResort.bottomAnchor, constant: 10),
            self.allTracks.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.allTracks.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            
            self.heightDifference.topAnchor.constraint(equalTo: allTracks.bottomAnchor, constant: 10),
            self.heightDifference.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.heightDifference.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            
            self.totalLengthOfTracks.topAnchor.constraint(equalTo: heightDifference.bottomAnchor, constant: 10),
            self.totalLengthOfTracks.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.totalLengthOfTracks.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
    }
    
    // MARK: - Selectors
      

}
