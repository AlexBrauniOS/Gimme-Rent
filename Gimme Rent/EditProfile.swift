//
//  EditProfile.swift
//  Gimme Rent
//
//  Created by Oleksiy Lubarets on 22.05.17.
//  Copyright © 2017 Alex Braun. All rights reserved.
//

import Foundation
import UIKit

class EditProfile {
    
    let name: String
    let photo: UIImage
    let age: String
    let phone: String
    let email: String
    let description: String
    init(name: String, photo: UIImage, age: String, phone: String, email: String, description: String){
        self.name = name
        self.photo = photo
        self.age = age
        self.phone = phone
        self.email = email
        self.description = description
    }
}
