//
//  RequestTableViewCell.swift
//  Gimme Rent
//
//  Created by Oleksiy Lubarets on 18.05.17.
//  Copyright © 2017 Alex Braun. All rights reserved.
//

import UIKit
import Parse

class RequestTableViewCell: UITableViewCell {

    @IBOutlet weak var CityOfRequest: UILabel!
    @IBOutlet weak var DateFrom: UILabel!
    @IBOutlet weak var DateTo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

}
