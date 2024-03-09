//
//  HomeViewController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 04.05.2023.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var collection = UICollectionView(
         frame: .zero,
         collectionViewLayout: makeLayout()
     )
    
    private let shopModel = SkiResortsGroup.skiShow()
    
    // MARK: - UI Components
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.text = "Привет"
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    private let footer: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage (named: "footer")
        iv.tintColor = .white
        return iv
    }()
    
    private var userEmail = ""

    //Choose a ski resort
    private let skiResort = CustomLabel(text: "Выбери горнолыжный курорт:", size: 20, color: .black)
    
    enum AllSkiResort: CaseIterable {
        case sheregesh, rosaKhutor, arhyz, dombai, bigWood, elbrus
    }
    
    let allSkiResort = AllSkiResort.allCases
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchUser()
        setupCollectionView()
    }

    private func makeLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 15
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(160),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(105))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        }
    
    private func setupCollectionView() {
        collection.register(ChoiceOfSkiResortCell.self, forCellWithReuseIdentifier: ChoiceOfSkiResortCell.cellID)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.clear
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        
        let ratio = footer.intrinsicContentSize.height / footer.intrinsicContentSize.width
        
        self.view.backgroundColor = .white
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выйти", style: .plain, target: self, action: #selector(didTapLogout))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Настройки", style: .plain, target: self, action: #selector(didTapSettings))
        
        self.navigationItem.backButtonTitle = "Назад"
        
        self.view.addSubview(footer)
        self.view.addSubview(label)
        self.view.addSubview(skiResort)
        self.view.addSubview(collection)
        
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.skiResort.translatesAutoresizingMaskIntoConstraints = false
        self.collection.translatesAutoresizingMaskIntoConstraints = false
        self.footer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            skiResort.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            skiResort.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            skiResort.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            collection.topAnchor.constraint(equalTo: skiResort.bottomAnchor, constant: 30),
            collection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            collection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            collection.heightAnchor.constraint(equalTo: self.view.heightAnchor),

            footer.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            footer.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            footer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            footer.heightAnchor.constraint(equalTo: footer.widthAnchor, multiplier: ratio)
        ])
    }
    
    // MARK: - Selectors
    @objc private func didTapSettings() {
        let vc = SettingsViewController()
        vc.userNameLabel.text = label.text
        vc.userEmail.text = userEmail
        self.navigationController?.pushViewController(vc, animated: true)
        //self.navigationController?.present(vc, animated: true)
    }
    
    @objc private func didTapLogout() {
        AuthService.shared.signOut { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showLogOutErrorAlert(on: self, with: error)
                return
            }
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }

    private func fetchUser() {
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showFetchingUserErrors(on: self, with: error)
                return
            }
            
            if let user = user {
                self.label.text = "Привет, \(user.usarname)!"
                self.userEmail = "E-mail: \(user.email)"
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shopModel.sky.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: ChoiceOfSkiResortCell.cellID, for: indexPath) as! ChoiceOfSkiResortCell
        cell.resortImage.image = shopModel.sky[indexPath.row].image
        cell.resortLabel.text = shopModel.sky[indexPath.row].name
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let allSki = allSkiResort[indexPath.row]
        
        switch allSki {
        case .sheregesh:
            let model = sheregeshInfo
            let vc = SkiResotViewController(nameSkiResot: model.nameSkiResot, allTracks: model.allTracks, heightDifference: model.heightDifference, totalLengthOfTracks: model.totalLengthOfTracks, apiWeather: model.apiWeather, imageSkiR: model.imageSkiR, descroption: model.descroption, timeWorkModel: model.timeWorkModel, costModel: model.costModel, hotelModel: model.hotelModel, rentsModel: model.rentsModel, latitudeMap: model.latitudeMap, longitudeMap: model.longitudeMap)
            //let vc = SheregeshTabBarController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .rosaKhutor:
            let vc = RosaKhutorTabBarController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .arhyz:
            let vc = ArhyzTabBarController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .dombai:
            let vc = DombaiTabBarViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .bigWood:
            let vc = BigWoodTabBarController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .elbrus:
            let vc = ElbrusRegionTabBarController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
