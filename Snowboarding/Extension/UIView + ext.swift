//
//  UIView + ext.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 29.09.2024.
//

import UIKit

extension UIView {
    
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
