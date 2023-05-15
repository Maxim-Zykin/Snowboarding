//
//  ArhyzInfo.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 14.05.2023.
//

import UIKit

class ArhyzInfo: UIView {
    
    // MARK: - Variables
    private let imageArhyz = UIImageView()
    private let aboutResort = CustomLabel(text: "Всесезонный курорт в горах Северного Кавказа, ориентирован на активный семейный отдых. Зимой сюда едут кататься на лыжах и сноуборде, летом доступны трассы для горного велосипеда, пешие и конные маршруты, джиппинг, экскурсии по красивейшим окрестностям Архыза.",  textAlignment: .left, size: 20, color: .black, numberOfLines: 20)
    
    private let allTracks = CustomLabel(text: "Всего трасс: 16", textAlignment: .left, size: 20, color: .black)
    private let heightDifference = CustomLabel(text: "Перепад высот: 854 м", textAlignment: .left, size: 20, color: .black)
    private let totalLengthOfTracks = CustomLabel(text: "Общая длина трасс: 26,8 км", textAlignment: .left, size: 20, color: .black)
    private let season = CustomLabel(text: "Горнолыжный сезон с декабря до апрель", textAlignment: .left, size: 20, color: .black)
    
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
        self.imageArhyz.image = UIImage(named: "arhyz")
        
        self.addSubview(imageArhyz)
        self.addSubview(aboutResort)
        self.addSubview(allTracks)
        self.addSubview(heightDifference)
        self.addSubview(totalLengthOfTracks)
        self.addSubview(season)
        
        imageArhyz.translatesAutoresizingMaskIntoConstraints = false
        aboutResort.translatesAutoresizingMaskIntoConstraints = false
        allTracks.translatesAutoresizingMaskIntoConstraints = false
        heightDifference.translatesAutoresizingMaskIntoConstraints = false
        totalLengthOfTracks.translatesAutoresizingMaskIntoConstraints = false
        season.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.imageArhyz.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            self.imageArhyz.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageArhyz.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageArhyz.heightAnchor.constraint(equalToConstant: 200),
            
            self.aboutResort.topAnchor.constraint(equalTo: imageArhyz.bottomAnchor, constant: 20),
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
            self.totalLengthOfTracks.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            
            self.season.topAnchor.constraint(equalTo: totalLengthOfTracks.bottomAnchor, constant: 10),
            self.season.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.season.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
    }
}

