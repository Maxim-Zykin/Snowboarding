//
//  AlertManager.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 05.03.2023.
//

import UIKit

class AlertManager {
    
    private static func showBasicAlert(on vc: UIViewController, with title: String, and message: String?) {
       
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            vc.present(alert, animated: true)
        }
    }
}

    // MARK: - Show Validation Alerts
extension AlertManager {
    
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Неверный e-mail", and: "Пожалуйста, введите паравильный e-mail")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Неверный пароль", and: "Пожалуйста, введите паравильный пароль")
    }
    
    public static func showInvalidUsernameAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Неверное имя пользователя", and: "Пожалуйста введите корректное имя")
    }
}

// MARK: - Registration Errors
extension AlertManager {
    
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Неизвестная ошибка регистрации", and: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Неизвестная ошибка регистрации", and: "\(error.localizedDescription)")
    }
}

// MARK: - Log In Errors
extension AlertManager {
    
    public static func showSignInErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Неизвестная ошибка входа", and: nil)
    }
    
    public static func showSignInErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Ошибка входа", and: "\(error.localizedDescription)")
    }
}

// MARK: - Log out Errors
extension AlertManager {
    
    public static func showLogOutErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Ошибка выхода ", and: "\(error.localizedDescription)")
    }
}

// MARK: - Delete Account
extension AlertManager {
    
    public static func showDeleteAccountAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Пользователь удален", and: nil)
    }
}

// MARK: - Delete Account Errors
extension AlertManager {
    
    public static func showDeleteAccountErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Ошибка удаления аккаунта ", and: "\(error.localizedDescription)")
    }
}

// MARK: - Forgot Password
extension AlertManager {
    
    public static func showPasswordResetSent(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "На e-mail отправилена ссылка для восстановления пароль", and: nil)
    }
    
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Ошибка сброса пароля", and: "\(error.localizedDescription)")
    }
}

// MARK: - Fetching User Errors
extension AlertManager {
    
    public static func showFetchingUserErrors(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Ошибка загрузки пользователя", and: "\(error.localizedDescription)")
        print(error.localizedDescription)
    }
    
    public static func showUnknowFetchingUserErrors(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Неизвестная ошибка при загрузки пользователя", and: nil)
    }
}
