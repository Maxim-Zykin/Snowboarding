//
//  LoginController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 26.02.2023.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    
    // MARK: - UI Components
    private let headerView = AuthHeaderView(appLabel: "SNOWBOARDING", title: "Войти", subTitle: "Войдите в свой аккаунт")
    
    private let emailField = CustomTextField(filedTypr: .email)
    private let passwordField = CustomTextField(filedTypr: .password)

    private let signInButton = CustomButtons(title: "Войти", hasBakground: true, fontSize: .big)
    private let newUserButton = CustomButtons(title: "Создать аккаунт", fontSize: .med)
    private let forgotPasswordButton = CustomButtons(title: "Забыли пароль?", fontSize: .small)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        view.addTapGestureToHideKeyboard()
        emailField.delegate = self
        passwordField.delegate = self
        
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addView(headerView)
        self.view.addView(emailField)
        self.view.addView(passwordField)
        self.view.addView(signInButton)
        self.view.addView(newUserButton)
        self.view.addView(passwordField)
        self.view.addView(forgotPasswordButton)

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 200),
            
            emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 160),
            emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 55),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 55),
            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 55),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            newUserButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 11),
            newUserButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            newUserButton.heightAnchor.constraint(equalToConstant: 40),
            newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor, constant: 2),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 20),
            forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ])
    }
    
    // MARK: - Selectors
    @objc private func didTapSignIn() {
        print("DEBUG PRINT:", "didTapSignIn")
        let loginRequest = LoginUserRequest(
            email: self.emailField.text ?? "",
            password: self.passwordField.text ?? ""
        )

        // Email check
        if !Validator.isValidEmail(for: loginRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // Password check
        if !Validator.isValidPassword(for: loginRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.singIn(with: loginRequest) { [weak self] error in
            guard let self = self else { return }
            if let error = error{
                AlertManager.showSignInErrorAlert(on: self, with: error)
                return
            }
            if let scenDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                scenDelegate.checkAuthentication()
            }
        }
    }
    
    @objc private func didTapNewUser() {
        print("DEBUG PRINT:", "didTapNewUser")
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapForgotPassword() {
        print("DEBUG PRINT:", "didTapForgotPassword")
        let vc = ForgotPasswordController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           if textField == emailField {
               passwordField.becomeFirstResponder()
           } else {
               passwordField.resignFirstResponder()
           }
        return true
       }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
