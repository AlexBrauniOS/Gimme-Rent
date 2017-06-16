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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: UIButton) {
        guard let login = loginTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        NetworkManager.login(withLogin: login, andPassword: password) { (user, error) in
            if error == nil {
                let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "RequestsTableViewController") as! RequestsTableViewController
                self.navigationController?.pushViewController(mainVC, animated: true)
            } else {
                print(error?.localizedDescription)
            }
        }
        
    }
}
