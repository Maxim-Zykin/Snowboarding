//
//  CustomButtons.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 26.02.2023.
//

import UIKit

class CustomButtons: UIButton {

    enum FontSize {
        case big
        case med
        case small
    }

    init(title: String, hasBakground: Bool = false, fontSize: FontSize) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        self.backgroundColor = hasBakground ? .systemBlue : .clear
        
        let titleColor: UIColor = hasBakground ? .white : .systemBlue
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize{
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        case .med:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
