//
//  ProfileViewController.swift
//  Gimme Rent
//
//  Created by Oleksiy Lubarets on 18.05.17.
//  Copyright © 2017 Alex Braun. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController
//, SaveProfileDelegat
{

    @IBOutlet var profileView: UIView!
    
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var ProfileAge: UILabel!
    @IBOutlet weak var ProfilePhone: UILabel!
    @IBOutlet weak var ProfileEmail: UILabel!
    @IBOutlet weak var ProfileDescription: UITextView!
    @IBOutlet weak var ProfileName: UILabel!
    
    var valueOfName: String = "Alex"
    var valueOfImage: UIImage = UIImage(named: "111")!
    var valueOfAge: String = "y.o"
    var valueOfPhone: String = "+38 (0__) ___-__-__"
    var valueOfEmail: String = "myemail@email.com"
    var valueOfDescription: String = "I don't want to write anything there."
    
//    var editProfile: [EditProfile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ProfileName.text = valueOfName
        ProfileImage.image = valueOfImage
        ProfileAge.text = valueOfAge
        ProfilePhone.text = valueOfPhone
        ProfileEmail.text = valueOfEmail
        ProfileDescription.text = valueOfDescription
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "EditProfileViewController" {
            if segue.destination is EditProfileViewController {
                
//                controller.profileDelegate = self
            }
        }
    }
    
    
//    func saveProfile(_ request: EditProfile) {
////        editProfile.append(request)
//        
//        
//    }
    
}
