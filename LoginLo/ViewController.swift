//
//  ViewController.swift
//  LoginLo
//
//  Created by Maksims Šalajevs on 17/05/2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var emailViewLine: UIView!
    @IBOutlet weak var passwordViewLine: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var noAccountLabel: UILabel!
    

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureLoginButton()
    }
    
    // MARK: - Actions
    @IBAction func loginButtonAction(_ sender: UIButton) {
        print("Login pressed")
    }
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        print("Signed up pressed")
    }
    
    
    
    // MARK: - Methods
    
    func configureLoginButton() {
        loginButton.layer.shadowColor = UIColor.green.cgColor
        loginButton.layer.shadowOffset = CGSize.init(width: 2, height: 6)
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 5
    }


}

