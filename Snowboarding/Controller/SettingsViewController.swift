//
//  SettingsViewController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 27.09.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    var userNameLabel = CustomLabel(text: "", textAlignment: .left, size: 26)
    private let logoutButton = CustomButtons(title: "Выйти из аккаунта", fontSize: .small)
    private let deleteAccountButton = CustomButtons(title: "Удалить аккаунт", fontSize: .small)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.logoutButton.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
        self.deleteAccountButton.addTarget(self, action: #selector(deleteAccount), for: .touchUpInside)
        setupUI()
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
    
    @objc private func deleteAccount() {
        AuthService.shared.delete { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showDeleteAccountErrorAlert(on: self, with: error)
                return
            }
        }
        AlertManager.showDeleteAccountAlert(on: self)
        let vc = LoginController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = UIColor(red: 231/255, green: 242/255, blue: 250/234, alpha: 255/255)

        self.view.addSubview(userNameLabel)
        self.view.addSubview(logoutButton)
        self.view.addSubview(deleteAccountButton)

        self.userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.logoutButton.translatesAutoresizingMaskIntoConstraints = false
        self.deleteAccountButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 20),
            userNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            userNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            logoutButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            logoutButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            logoutButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            deleteAccountButton.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 5),
            deleteAccountButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            deleteAccountButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
        ])
    }
}
