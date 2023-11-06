//
//  InfrastructureInformationCell.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 13.09.2023.
//

import UIKit

class InfrastructureInformationCell: UICollectionViewCell {
    
    static let cellID = "InfrastructureInformationCell"
    
    let infoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    let infoLabel: UILabel = {
        let text = UILabel()
        text.textColor = UIColor.white
        text.textAlignment = .right
        text.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        text.layer.shadowColor = UIColor.black.cgColor
        text.layer.shadowRadius = 3.0
        text.layer.shadowOpacity = 1.0
        text.layer.shadowOffset = CGSize(width: 4, height: 4)
        text.layer.masksToBounds = false
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        backgroundColor = .white
        self.addSubview(infoImage)
        self.addSubview(infoLabel)
        infoImage.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false

        infoImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        infoImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        infoImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        infoImage.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

        infoLabel.topAnchor.constraint(equalTo: infoImage.bottomAnchor, constant: -45).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        self.layer.shadowRadius = 5
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 3, height: 5)
        self.clipsToBounds = false
    }
}
