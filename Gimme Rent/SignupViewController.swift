//
//  SignupViewController.swift
//  Gimme Rent
//
//  Created by Oleksii Liubarets on 03.07.17.
//  Copyright © 2017 Alex Braun. All rights reserved.
//

import UIKit
import Parse

class SignupViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {
        signupButton.layer.cornerRadius = signupButton.frame.height/2
    }
    
    @IBAction func SingupButton(_ sender: UIButton) {
        let user = PFUser()
        user.username = loginTextField.text
        user.email = emailTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackground() {
            (success, error) -> Void in
            if let error = error as NSError? {
                let errorString = error.userInfo["error"] as? NSString
                print(errorString)
            } else {
                guard let login = self.loginTextField.text else {return}
                guard let password = self.passwordTextField.text else {return}
                
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
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
