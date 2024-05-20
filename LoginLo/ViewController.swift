//
//  ViewController.swift
//  LoginLo
//
//  Created by Maksims Šalajevs on 17/05/2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailImage: UIImageView!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var emailViewLine: UIView!
    @IBOutlet weak var passwordViewLine: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var noAccountLabel: UILabel!
    
    
    // MARK: - Properties
    
    private let activeColour = UIColor(named: "myFirst") ?? UIColor.green
    private var email = ""
    private var password = ""
    
    private let mockEmail = "abc@gmail.com"
    private let mockPasword = "123456"
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureLoginButton()
        textFieldEmail.delegate = self
       textFieldPassword.delegate = self
        textFieldEmail.becomeFirstResponder()
    }
    
    // MARK: - Actions
    @IBAction func loginButtonAction(_ sender: UIButton) {
        textFieldPassword.resignFirstResponder()
        textFieldEmail.resignFirstResponder()
        
        if email.isEmpty {
            makeErrorField(textField: textFieldEmail)
        }
        
        if password.isEmpty {
            makeErrorField(textField: textFieldPassword)
        }
        
        if email == mockEmail, password == mockPasword {
            performSegue(withIdentifier: "goToHomePage", sender: sender)
        } else {
            let alert = UIAlertController(title: "Error".localized, message: "Wrong email or password".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        print("Signed up pressed")
    }
    
    
    
    // MARK: - Methods
    
    func configureLoginButton() {
        loginButton.layer.shadowColor = activeColour.cgColor
        loginButton.layer.shadowOpacity = 1
        loginButton.layer.shadowRadius = 6
        loginButton.layer.shadowOffset = CGSize(width: 2, height: 4)
    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
        !text.isEmpty else { return }
        
        switch textField {
        case textFieldEmail:
            let isValidEmail = check(email: text)
            if isValidEmail {
                email = text
                emailImage.tintColor = activeColour
                emailViewLine.backgroundColor = activeColour
            } else {
                makeErrorField(textField: textField)
            }
        case textFieldPassword:
            let isValidPassword = check(password: text)
            if isValidPassword {
                password = text
                lockImage.tintColor = activeColour
                passwordViewLine.backgroundColor = activeColour
            } else {
                makeErrorField(textField: textField)
            }
        default:
            print("unknown")
        }
    }
    
    private func check(email: String) -> Bool {
        email.contains("@") && email.contains(".")
    }
    
    private func check(password: String) -> Bool {
        password.count >= 4
    }
    
    private func makeErrorField(textField: UITextField) {
        switch textField {
        case textFieldEmail:
            emailImage.tintColor = UIColor.red
            emailViewLine.backgroundColor = UIColor.red
        case textFieldPassword:
            lockImage.tintColor = UIColor.red
            passwordViewLine.backgroundColor = UIColor.red
        default:
            print("unknown")
        }
    }
}

