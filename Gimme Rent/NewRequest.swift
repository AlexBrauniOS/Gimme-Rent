//
//  NewRequest.swift
//  Gimme Rent
//
//  Created by Oleksiy Lubarets on 18.05.17.
//  Copyright © 2017 Alex Braun. All rights reserved.
//

import Foundation
import UIKit

class NewRequest {
    
    let city: String
    let periodFrom: String
    let periodTo: String
    let people: Int
    let cost: Int
    let detailsOfRequest: String
    init(city: String, periodFrom: String, periodTo: String, people: Int, cost: Int, detailsOfRequest: String){
        self.city = city
        self.periodFrom = periodFrom
        self.periodTo = periodTo
        self.people = people
        self.cost = cost
        self.detailsOfRequest = detailsOfRequest
    }
    
}
