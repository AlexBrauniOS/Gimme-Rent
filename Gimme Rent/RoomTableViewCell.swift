//
//  RoomTableViewCell.swift
//  Gimme Rent
//
//  Created by Oleksiy Lubarets on 01.06.17.
//  Copyright © 2017 Alex Braun. All rights reserved.
//

import UIKit
import Parse

class RoomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var AdressInMyRoomsCellLabel: UILabel!
    @IBOutlet weak var SeatsInMyRoomsCellLabel: UILabel!
    @IBOutlet weak var PriceInMyRoomsCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
