//
//  LoginViewController.swift
//  Door Opener
//
//  Created by Luka Usalj on 16/05/16.
//  Copyright (c) 2016 FER. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

// MARK: -  Login View Controller -
final class LoginViewController: UIViewController {
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Login view interface requirements
    var presenter: LoginViewDelegateInterface!
}

// MARK: - Extensions -

extension LoginViewController: LoginViewInterface {
    var username: String? {
        return usernameTextField.text
    }
    
    var password: String? {
        return passwordTextField.text
    }
    
    func clearForm() {
        usernameTextField.text = ""
        passwordTextField.text = ""
        usernameTextField.becomeFirstResponder()
    }
    
    func showErrorMessage(errorMessage: String) {}
    func showErrorMessage(errorMessage: String, completionHandler: (() -> ())) {}
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        switch textField {

        case usernameTextField:
            passwordTextField.becomeFirstResponder()

        case passwordTextField:
            passwordTextField.resignFirstResponder()
            presenter.didTouchReturnOnPasswordTextField()
            
        default:
            break
        }
        return false
    }
}
