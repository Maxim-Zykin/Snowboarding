//
//  HomeController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 26.02.2023.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - UI Components
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.text = "Привет"
        label.numberOfLines = 2
        return label
    }()
    //Choose a ski resort
    private let skiResort = CuslomLabel(text: "Выбери горнолыжный курорт:", size: 24)
    
    private let resort = ChoiceOfSkiResort()
    
    var cells = [SkiResorts]()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchUser()
        resort.set(cells: SkiResorts.fetchSkiResorts())
        

    }
    
    // MARK: - UI Setup
    private func setupUI() {
        
        self.view.backgroundColor = .systemBackground
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogout))
        
        self.view.addSubview(label)
        self.view.addSubview(skiResort)
        self.view.addSubview(resort)

        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.skiResort.translatesAutoresizingMaskIntoConstraints = false
        self.resort.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            self.skiResort.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            self.skiResort.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.skiResort.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            self.resort.topAnchor.constraint(equalTo: skiResort.bottomAnchor, constant: 30),
            self.resort.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            self.resort.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            self.resort.heightAnchor.constraint(equalTo: self.view.heightAnchor)
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
    
//    @objc private func testBut() {
//        let vc = ResortInformationController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
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
