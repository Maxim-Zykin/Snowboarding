//
//  DombaiInfo.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 14.05.2023.
//

import UIKit

class DombaiInfo: UIView {

    // MARK: - Variables
    private let imageDombai = UIImageView()
    private let aboutResort = CustomLabel(text: "Горный курорт Домбай (Домбайская поляна) расположился на территории Карачаево-Черкесской республики, у подножия Главного хребта Кавказских гор. Домбай относится к всесезонному туристическому комплексу: с декабря по апрель создаются идеальные условия для активного катания по склонам, май - август - время для пешего туризма, ранняя осень - “бархатный” сезон, и только октябрь и ноябрь - сезон затишья.",  textAlignment: .left, size: 18, color: .black, numberOfLines: 20)
    
    private let allTracks = CustomLabel(text: "Всего трасс: 9", textAlignment: .left, size: 18, color: .black)
    private let heightDifference = CustomLabel(text: "Перепад высот: 1538 м", textAlignment: .left, size: 18, color: .black)
    private let totalLengthOfTracks = CustomLabel(text: "Общая длина трасс: 16,2 км", textAlignment: .left, size: 18, color: .black)
    private let season = CustomLabel(text: "Горнолыжный сезон с декабря до апрель", textAlignment: .left, size: 18, color: .black)
    
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
        self.imageDombai.image = UIImage(named: "dombai")
        
        self.addSubview(imageDombai)
        self.addSubview(aboutResort)
        self.addSubview(allTracks)
        self.addSubview(heightDifference)
        self.addSubview(totalLengthOfTracks)
        self.addSubview(season)
        
        imageDombai.translatesAutoresizingMaskIntoConstraints = false
        aboutResort.translatesAutoresizingMaskIntoConstraints = false
        allTracks.translatesAutoresizingMaskIntoConstraints = false
        heightDifference.translatesAutoresizingMaskIntoConstraints = false
        totalLengthOfTracks.translatesAutoresizingMaskIntoConstraints = false
        season.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.imageDombai.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            self.imageDombai.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageDombai.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageDombai.heightAnchor.constraint(equalToConstant: 200),
            
            self.aboutResort.topAnchor.constraint(equalTo: imageDombai.bottomAnchor, constant: 20),
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
