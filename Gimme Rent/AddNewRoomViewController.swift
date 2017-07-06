//
//  AddNewRoomViewController.swift
//  Gimme Rent
//
//  Created by Oleksiy Lubarets on 01.06.17.
//  Copyright © 2017 Alex Braun. All rights reserved.
//

import UIKit
import Parse

protocol SaveNewRoom {
    func saveNewRoom(_ room: NewRoom)
    
}

class AddNewRoomViewController: UIViewController {
    
    @IBOutlet weak var AddCity: UILabel!
    @IBOutlet weak var AddAdress: UITextField!
    @IBOutlet weak var AddRooms: UILabel!
    @IBOutlet weak var AddSeats: UILabel!
    @IBOutlet weak var AddPrice: UITextField!
    @IBOutlet weak var AddPhotos: UICollectionView!
    
    
    var delegateNewRoom: SaveNewRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func AddAdressAction(_ sender: UITextField) {
        AddAdress.text = sender.text
    }
    
    @IBAction func AddRoomsAction(_ sender: UIStepper) {
        AddRooms.text = String(Int(sender.value))
    }
    
    @IBAction func AddSeatsAction(_ sender: UIStepper) {
        AddSeats.text = String(Int(sender.value))
    }
    
    @IBAction func AddPriceAction(_ sender: UITextField) {
        AddAdress.text = sender.text
    }
    
    
    @IBAction func SaveNewRoomButton(_ sender: Any) {
    
        let city = AddCity.text
        let adress = AddAdress.text
        let rooms = Int(AddRooms.text!)
        let seats = Int(AddSeats.text!)
        let price = Int(AddPrice.text!)
//        let roomPhotos = .images
        
        let newRoom = NewRoom(city: city!, adress: adress!, rooms: rooms!, seats: seats!, price: price!
//                             , roomPhotos: roomPhotos!
        )
        
        delegateNewRoom?.saveNewRoom(newRoom)
    
        self.navigationController?.popViewController(animated: true)
        
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
