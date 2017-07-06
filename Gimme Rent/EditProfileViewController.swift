//
//  NewViewController.swift
//  Gimme Rent
//
//  Created by Oleksiy Lubarets on 22.05.17.
//  Copyright © 2017 Alex Braun. All rights reserved.
//

import UIKit
import Parse

//protocol SaveProfileDelegat {
//    func saveProfile(_ editProfile: EditProfile)
//}

class EditProfileViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var UserNameLabel: UITextView!
    @IBOutlet weak var UserPhotoImage: UIImageView!
    @IBOutlet weak var UserAgeLabel: UITextView!
    @IBOutlet weak var UserPhoneLabel: UITextView!
    @IBOutlet weak var UserEmailLabel: UITextView!
    @IBOutlet weak var UserDescriptionLabel: UITextView!
    
    
    //    var profileDelegate: SaveProfileDelegat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        UserPhotoImage.layer.cornerRadius = UserPhotoImage.frame.height/2
        UserPhotoImage.layer.masksToBounds = true
    }
    
    @IBAction func SaveProfileButton(_ sender: UIBarButtonItem) {
        
        ProfileViewController().valueOfName = UserNameLabel.text ?? "LOL"
        ProfileViewController().valueOfImage = UserPhotoImage.image ?? UIImage(named: "111")!
        ProfileViewController().valueOfAge = UserAgeLabel.text + "y.o."
        ProfileViewController().valueOfPhone = UserPhoneLabel.text ?? "LOL"
        ProfileViewController().valueOfEmail = UserEmailLabel.text ?? "LOL"
        ProfileViewController().valueOfDescription = UserDescriptionLabel.text ?? "LOL"
        
//        let editProfile
        
        _ = EditProfile(name: ProfileViewController().valueOfName, photo: ProfileViewController().valueOfImage, age: ProfileViewController().valueOfAge, phone: ProfileViewController().valueOfPhone, email: ProfileViewController().valueOfEmail, description: ProfileViewController().valueOfDescription)
        
        //        profileDelegate?.saveProfile(editProfile)
        _ = self.navigationController?.popViewController(animated: true)
    }
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        var save: ProfileViewController = segue.destination as! ProfileViewController
    //    }
    
    }

extension EditProfileViewController: UIImagePickerControllerDelegate{
    
    @IBAction func AddPhotoFromCamera(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.camera
        image.allowsEditing = false
        
        self.present(image, animated: true){
            
        }
    }
    
    @IBAction func AddPhotoFromGalary(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true){
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            UserPhotoImage.image = image
        } else {
            
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
