//
//  HotelsViewController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 06.10.2023.
//

import UIKit

class HotelsViewController: UIViewController {

    lazy var collection = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeLayout())
    
    var model: [AllHotels] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Гостиницы"
        setupUI()
        setupCollectionView()
    }
    
    private func makeLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 20
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(280))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func setupCollectionView() {
        collection.register(HotelsCollectionViewCell.self, forCellWithReuseIdentifier: HotelsCollectionViewCell.cellID)
        collection.delegate = self
        collection.dataSource = self
    }
    
    private func setupUI() {
        self.view.addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HotelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: HotelsCollectionViewCell.cellID, for: indexPath) as! HotelsCollectionViewCell
        cell.hotelImage.image = model[indexPath.row].image
        cell.nameLabel.text = model[indexPath.row].name
        cell.adressLabel.text = model[indexPath.row].address
        cell.phoneLabel.text = model[indexPath.row].phone
        return cell
    }
}
