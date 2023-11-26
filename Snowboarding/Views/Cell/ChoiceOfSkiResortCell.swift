//
//  ChoiceOfSkiResortCell.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 29.04.2023.
//

import UIKit

class ChoiceOfSkiResortCell: UICollectionViewCell {
    
    static let cellID = "ChoiceOfSkiResortCell"
    
    let resortImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    let resortLabel: UILabel = {
        let text = UILabel()
        text.textColor = UIColor.white
        text.textAlignment = .center
        text.numberOfLines = 2
        text.font = UIFont.systemFont(ofSize: 22, weight: .bold)
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
        self.addSubview(resortImage)
        self.addSubview(resortLabel)
        resortImage.translatesAutoresizingMaskIntoConstraints = false
        resortLabel.translatesAutoresizingMaskIntoConstraints = false

        resortImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        resortImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        resortImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        resortImage.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

        resortLabel.centerYAnchor.constraint(equalTo: resortImage.centerYAnchor).isActive = true
        resortLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        resortLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
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
