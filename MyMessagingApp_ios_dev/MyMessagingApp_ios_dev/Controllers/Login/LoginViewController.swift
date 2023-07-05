//
//  LoginViewController.swift
//  MyMessagingApp_ios_dev
//
//  Created by DA MAC  M1 154 on 2023/06/29.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocapitalizationType = .none
        field.layer.shadowOffset = CGSize(width: 3, height: 3)
        field.layer.shadowOpacity = 0.4
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email Address..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        return field
    }()
    
    private let PasswordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.shadowOffset = CGSize(width: 3, height: 3)
        field.layer.shadowOpacity = 0.4
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.4
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Log In"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(didTapRegister))
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        emailField.delegate = self
        PasswordField.delegate = self
        
        view.addSubview(scrollView)
        view.addSubview(imageView)
        view.addSubview(emailField)
        view.addSubview(PasswordField)
        view.addSubview(loginButton)
        configureConstraints()
    }
    
    private func configureConstraints() {
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        
        let imageViewConstraiants = [
//            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
//            imageView.heightAnchor.constraint(equalToConstant: 120),
//            imageView.widthAnchor.constraint(equalToConstant: 120),
//            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
            
            // Set imageView constraints
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
        ]
        
        let emailFieldContraints = [
//            emailField.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
//            emailField.heightAnchor.constraint(equalToConstant: 50),
//            emailField.widthAnchor.constraint(equalToConstant: 350),
//            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
            // Set emailField constraints
            emailField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ]
        let PasswordFieldContraints = [
//            PasswordField.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
//            PasswordField.heightAnchor.constraint(equalToConstant: 50),
//            PasswordField.widthAnchor.constraint(equalToConstant: 350),
//            PasswordField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
            // Set PasswordField constraints
            PasswordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 30),
            PasswordField.heightAnchor.constraint(equalToConstant: 50),
            PasswordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            PasswordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
        ]
        
        let loginButtonContraints = [
//            PasswordField.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
//            PasswordField.heightAnchor.constraint(equalToConstant: 50),
//            PasswordField.widthAnchor.constraint(equalToConstant: 350),
//            PasswordField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
            // Set loginButton constraints
            loginButton.topAnchor.constraint(equalTo: PasswordField.bottomAnchor, constant: 30),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            
            
            
        ]
        
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(imageViewConstraiants)
        NSLayoutConstraint.activate(emailFieldContraints)
        NSLayoutConstraint.activate(PasswordFieldContraints)
        NSLayoutConstraint.activate(loginButtonContraints)
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        scrollView.frame = view.bounds
//
//        let size = scrollView.width/3
//        imageView.frame = CGRect(x: (scrollView.width-size)/2,
//                                 y: 20,
//                                 width: size,
//                                 height: size)
//        emailField.frame = CGRect(x: 30,
//                                  y: imageView.bottom-100,
//                                  width: scrollView.width-60,
//                                 height: 52)
//        PasswordField.frame = CGRect(x: 30,
//                                  y: emailField.bottom+200,
//                                  width: scrollView.width-60,
//                                 height: 52)
//        loginButton.frame = CGRect(x: 30,
//                                  y: PasswordField.bottom+300,
//                                  width: scrollView.width-60,
//                                 height: 52)
//    }
    
    @objc private func loginButtonTapped() {
        
        emailField.resignFirstResponder()
        PasswordField.resignFirstResponder()
        
        guard let email = emailField.text, let password = PasswordField.text,
              !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            alertUserLoginError()
            return
        }
        //firebase log in
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] authResult, error in
            
            guard let strongSelf = self else {
                return
            }
            
            guard let result = authResult, error == nil else {
                print("Failed to log in the user with email:\(email)")
                return
            }
            let user = result.user
            print("Logged in User:\(user)")
            strongSelf.navigationController?.dismiss(animated: true, completion: nil)

        })
    }
    
    func alertUserLoginError() {
        let alert = UIAlertController(title: "woops", message: "please enter all information to log in ", preferredStyle: .alert)
        alert.addAction((UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)))
        
        present(alert, animated: true)
    }
    
    @objc private func didTapRegister() {
        let vc = RegisterViewController()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailField {
            PasswordField.becomeFirstResponder()
        }
        else if textField == emailField {
            loginButtonTapped()
        }
        return true
    }
}
