//
//  AuthHeaderView.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 26.02.2023.
//

import UIKit

class AuthHeaderView: UIView {
    
    
    // MARK: - UI Components
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage (named: "Snowboarding")
        iv.tintColor = .white
        return iv
    }()
    
    private let appLabel: UILabel = {
        let label = UILabel()
            label.textColor = .label
            label.textAlignment = .center
            label.font = UIFont(name: "Gill Sans", size: 40)
            label.text = "Error"
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
            label.textColor = .label
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 26, weight: .bold)
            label.text = "Error"
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    // MARK: - LifeCycle
    init(appLabel: String, title: String, subTitle: String) {
        super.init(frame: .zero)
        self.appLabel.text = appLabel
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.addSubview(logoImageView)
        self.addSubview(appLabel)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
            
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        appLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 180),
            self.logoImageView.heightAnchor.constraint (equalTo: logoImageView.widthAnchor),
            
            self.appLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            self.appLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.appLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: appLabel.bottomAnchor, constant: 12),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }

}
