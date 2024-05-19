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
    
    //private var activeColour = UIColor(named: "myFirst") ?? UIColor.green

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureLoginButton()
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
    }
    
    // MARK: - Actions
    @IBAction func loginButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "goToHomePage", sender: sender)
    }
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        print("Signed up pressed")
    }
    
    
    
    // MARK: - Methods
    
    func configureLoginButton() {
        loginButton.layer.shadowColor = (UIColor.init(named: "myFirst") ?? UIColor.green).cgColor
        loginButton.layer.shadowOpacity = 1
        loginButton.layer.shadowRadius = 8
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 5)
    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        
        switch textField {
        case textFieldEmail:
            let isValidEmail = check(email: text)
        case textFieldPassword:
            let isValidPassword = check(email: text)
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
}

