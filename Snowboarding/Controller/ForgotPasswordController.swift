//
//  ForgotPasswordController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 26.02.2023.
//

import UIKit

class ForgotPasswordController: UIViewController, UITextFieldDelegate {
    
    // MARK: - UI Components
    
    private let headerView = AuthHeaderView(appLabel: "SNOWBOARDING", title: "Забыли пароль", subTitle: "Восстановить пароль")
    
    private let emailField = CustomTextField(filedTypr: .email)
    
    private let resetPasswordButton = CustomButtons(title: "Восстановить", hasBakground: true, fontSize: .big)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addTapGestureToHideKeyboard()
        emailField.delegate = self
        
        self.setupUI()
        self.resetPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(resetPasswordButton)
        
        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 230),
            
            emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 130),
            emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 55),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            resetPasswordButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            resetPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 55),
            resetPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ])
    }
    
    // MARK: - Selectors
    @objc private func didTapForgotPassword(){
        let email = emailField.text ?? ""
        
        if !Validator.isValidEmail(for: email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        AuthService.shared.forgotPassword(with: email) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showErrorSendingPasswordReset(on: self, with: error)
                return
            }
            AlertManager.showPasswordResetSent(on: self)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           if textField == emailField {
               emailField.resignFirstResponder()
           }
        return true
       } 
}
