//
//  LoginViewController.swift
//  Gimme Rent
//
//  Created by Oleksiy Lubarets on 14.06.17.
//  Copyright © 2017 Alex Braun. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
        loginButton.layer.cornerRadius = loginButton.frame.height/2
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        guard let login = loginTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        NetworkManager.login(withLogin: login, andPassword: password) { (user, error) in
            if (PFUser.current() != nil) {
                let mainSB = UIStoryboard(name: "Main", bundle: nil)
                let mainVC = mainSB.instantiateViewController(withIdentifier: "TabBarController")
                self.present(mainVC, animated: true, completion: nil)
            } else {
                print(error!.localizedDescription)
            }
        }
    }
}
