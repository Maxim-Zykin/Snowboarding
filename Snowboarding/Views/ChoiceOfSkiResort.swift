//
//  ChoiceOfSkiResort.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 27.04.2023.
//

import UIKit

class ChoiceOfSkiResort: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells = [SkiResorts]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        backgroundColor = .white
        
        delegate = self
        dataSource = self
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        register(ChoiceOfSkiResortCell.self, forCellWithReuseIdentifier: ChoiceOfSkiResortCell.cellID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(cells: [SkiResorts]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ChoiceOfSkiResortCell.cellID, for: indexPath) as! ChoiceOfSkiResortCell
        cell.resortImage.image = cells[indexPath.row].image
        cell.resortLabel.text = cells[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let size = (collectionView.frame.size.width - 1) / 2
        return CGSize(width: 150, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(cells[indexPath.row].name)
//                let vc = ResortInformationController()
//                self.navigationController?.pushViewController(vc, animated: true)
    }
}

