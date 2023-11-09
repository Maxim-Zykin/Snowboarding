//
//  extension.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 14.05.2023.
//

import Foundation
import UIKit

extension UIView {

    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        addGestureRecognizer(tapGesture)
    }

    var topSuperview: UIView? {
        var view = superview
        while view?.superview != nil {
            view = view!.superview
        }
        return view
    }
    
   @objc func dismissKeyboard() {
        topSuperview?.endEditing(true)
    }
}


extension UIScrollView {

    func resizeScrollViewContentSize() {
        var contentRect = CGRect.zero
        for view in self.subviews {
            contentRect = contentRect.union(view.frame)
        }
        self.contentSize = contentRect.size
    }
}

extension String {
    func firstCharOnly() -> String {
    return prefix(1).uppercased() + self.dropFirst()
    }
}
