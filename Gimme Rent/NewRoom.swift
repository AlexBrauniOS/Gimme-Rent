//
//  NewRoom.swift
//  Gimme Rent
//
//  Created by Oleksiy Lubarets on 01.06.17.
//  Copyright © 2017 Alex Braun. All rights reserved.
//

import Foundation
import UIKit

class NewRoom {
    
    let city: String
    let adress: String
    let rooms: Int
    let seats: Int
    let price: Int
//    let roomPhotos: UICollectionView
    init(city: String, adress: String, rooms: Int, seats: Int, price: Int
//        , roomPhotos: UICollectionView
        ){
        self.city = city
        self.adress = adress
        self.rooms = rooms
        self.seats = seats
        self.price = price
//        self.roomPhotos = roomPhotos
    }

}
