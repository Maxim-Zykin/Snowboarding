//
//  SkiResortsCollectionViewCell.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 11.04.2023.
//

import UIKit

class SkiResortsCollectionViewCell: UICollectionViewCell {
    
    private let imageSky: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "skiResorts.image")
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
            label.textColor = .label
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 20, weight: .bold)
            label.text = "Error"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ cell: SkiResorts) {
        imageSky.image = cell.image
        titleLabel.text = cell.name
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: 100.0, height: 130.0)
    }
    
    private func setupUI() {
        self.addSubview(imageSky)
        self.addSubview(titleLabel)
        imageSky.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.imageSky.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            self.imageSky.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageSky.widthAnchor.constraint(equalToConstant: 100),
            self.imageSky.heightAnchor.constraint (equalTo: imageSky.widthAnchor),
            
            
            self.titleLabel.topAnchor.constraint(equalTo: imageSky.bottomAnchor, constant: 5),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
