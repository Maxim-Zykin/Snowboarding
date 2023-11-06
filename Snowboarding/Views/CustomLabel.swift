//
//  CuslomLabel.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 28.03.2023.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(text: String, textAlignment: NSTextAlignment = .left, size: CGFloat = 20, color: UIColor = .label, numberOfLines: Int = 0, textFont: UIFont = .systemFont(ofSize: 20, weight: .regular)) {
        self.init(frame: .zero)
        self.text = text
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.font = .systemFont(ofSize: size, weight: .regular)
        self.textColor = color
    }
}
