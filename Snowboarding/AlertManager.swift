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
        self.showBasicAlert(on: vc, with: "Invalid e-mail", and: "Please enter a valid e-mail")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Invalid password", and: "Please enter a valid password")
    }
    
    public static func showInvalidUsernameAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Invalid User name", and: "Please enter a valid User name")
    }
}

// MARK: - Registration Errors
extension AlertManager {
    
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Unknow registration error", and: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Unknow registration error", and: "\(error.localizedDescription)")
    }
}

// MARK: - Log In Errors
extension AlertManager {
    
    public static func showSignInErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Unknow error Signing In", and: nil)
    }
    
    public static func showSignInErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Error Signing In", and: "\(error.localizedDescription)")
    }
}

// MARK: - Log out Errors
extension AlertManager {
    
    public static func showLogOutErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Logout error ", and: "\(error.localizedDescription)")
    }
}

// MARK: - Forgot Password
extension AlertManager {
    
    public static func showPasswordResetSent(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Password reset sent", and: nil)
    }
    
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Error sending password reset", and: "\(error.localizedDescription)")
    }
}

// MARK: - Fetching User Errors
extension AlertManager {
    
    public static func showFetchingUserErrors(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Error fetching User", and: "\(error.localizedDescription)")
    }
    
    public static func showUnknowFetchingUserErrors(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Unknow error fetching User", and: nil)
    }
}
