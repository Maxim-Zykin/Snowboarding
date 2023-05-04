//
//  Collection.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 04.05.2023.
//

import UIKit

class Collection: UIView {

    let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
                
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.register(ChoiceOfSkiResortCell.self, forCellWithReuseIdentifier: ChoiceOfSkiResortCell.cellID)
                return cv
            }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
