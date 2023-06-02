//
//  HomeViewController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 04.05.2023.
//

import UIKit

class HomeViewController: UIViewController {

    var collection: UICollectionView?
    
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
    
    //Choose a ski resort
    private let skiResort = CustomLabel(text: "Выбери горнолыжный курорт:", size: 20, color: .black)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        setupUI()
        fetchUser()
    }

    private func setupCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 160, height: 105)
        layout.minimumLineSpacing = 20
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collection = collection else { return }
        collection.register(ChoiceOfSkiResortCell.self, forCellWithReuseIdentifier: ChoiceOfSkiResortCell.cellID)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        
        let ratio = footer.intrinsicContentSize.height / footer.intrinsicContentSize.width
        
        self.view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogout))
        
        self.navigationItem.backButtonTitle = "Назад"
        
        self.view.addSubview(label)
        self.view.addSubview(skiResort)
        self.view.addSubview(collection!)
        self.view.addSubview(footer)

        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.skiResort.translatesAutoresizingMaskIntoConstraints = false
        self.collection!.translatesAutoresizingMaskIntoConstraints = false
        self.footer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            self.skiResort.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            self.skiResort.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.skiResort.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            self.collection!.topAnchor.constraint(equalTo: skiResort.bottomAnchor, constant: 30),
            self.collection!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.collection!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.collection!.heightAnchor.constraint(equalTo: self.view.heightAnchor),
        
            self.footer.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.footer.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.footer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.footer.heightAnchor.constraint(equalTo: footer.widthAnchor, multiplier: ratio)
        ])
    }
    
    // MARK: - Selectors
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
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shopModel.sky.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection!.dequeueReusableCell(withReuseIdentifier: ChoiceOfSkiResortCell.cellID, for: indexPath) as! ChoiceOfSkiResortCell
        cell.resortImage.image = shopModel.sky[indexPath.row].image
        cell.resortLabel.text = shopModel.sky[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 1) / 2
        return CGSize(width: size, height: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 90
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 80
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(shopModel.sky[indexPath.row].name)
        let correct = indexPath.row
        switch correct {
        case 0:
            let vc = SheregeshTabBarController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = RosaKhutorTabBarController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = ArhyzTabBarController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = DombaiTabBarViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
