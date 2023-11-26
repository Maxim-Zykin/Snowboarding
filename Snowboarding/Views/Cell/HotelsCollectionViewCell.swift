//
//  HotelsCollectionViewCell.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 15.09.2023.
//

import UIKit

class HotelsCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "HotelsCollectionViewCell"
    
    var viewC: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(
            red: 38/255,
            green: 42/255,
            blue: 56/255,
            alpha: 255/255
        )
        return view
    }()

    var hotelImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    var nameLabel = CustomLabel(text: "", textAlignment: .left, size: 20, color: .white)
    
    var phoneLabel = CustomButtons(title: "", fontSize: .small)
    
    var phoneNumber: String?
    
    var adressLabel = CustomLabel(text: "", textAlignment: .left, size: 16, color: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        phoneLabel.addTarget(self, action: #selector(call), for: .touchUpInside)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        hotelImage.frame = CGRect(x: 12, y: 12, width: 120, height: 120)
    }
    
    @objc func call() {
        if let url = URL(string: "tel://\(phoneNumber ?? "")"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
    }
    
    private func setupUI() {
        hotelImage.clipsToBounds = true
        
        backgroundColor = .white
        contentView.addSubview(viewC)
        contentView.addSubview(hotelImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(adressLabel)
        
        viewC.translatesAutoresizingMaskIntoConstraints = false
        hotelImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        adressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        viewC.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        viewC.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        viewC.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewC.heightAnchor.constraint(equalTo: heightAnchor, constant: 10).isActive = true

        hotelImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        hotelImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        hotelImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        hotelImage.heightAnchor.constraint(equalTo: heightAnchor, constant: -80).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: hotelImage.bottomAnchor, constant: 5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true

        phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        adressLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor).isActive = true
        adressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        adressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
    }
}
