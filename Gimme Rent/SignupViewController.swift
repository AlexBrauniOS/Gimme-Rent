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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
                let mainSB = UIStoryboard(name: "Main", bundle: nil)
                let mainVC = mainSB.instantiateViewController(withIdentifier: "TabBarController")
                self.present(mainVC, animated: true, completion: nil)
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
