//
//  CustomTextField.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 26.02.2023.
//

import UIKit

class CustomTextField: UITextField, UITextFieldDelegate {

    enum CustomTextFieldType {
        case userName
        case email
        case password
    }

    private let authFiledType: CustomTextFieldType
    
    init(filedTypr: CustomTextFieldType){
        self.authFiledType = filedTypr
        super.init(frame: .zero)
        
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 10
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
    
        switch filedTypr{
        case .userName:
            self.placeholder = "Имя"
            
        case .email:
            self.placeholder = "E-mail"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = "Пароль"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}
