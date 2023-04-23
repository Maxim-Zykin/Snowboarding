//
//  CuslomLabel.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 28.03.2023.
//

import UIKit

class CuslomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(text: String, textAlignment: NSTextAlignment = .left, size: CGFloat, color: UIColor = .label) {
        self.init(frame: .zero)
        self.text = text
        self.textAlignment = textAlignment
        //self.font = .systemFont(ofSize: size, weight: <#T##UIFont.Weight#>)
        self.textColor = color
    }
}
