//
//  ViewController.swift
//  MyMessagingApp_ios_dev
//
//  Created by DA MAC  M1 154 on 2023/06/19.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
//        validateAuth()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if FirebaseAuth.Auth.auth().currentUser != nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }
    
    private func validateAuth() {
        
        
    }
}

