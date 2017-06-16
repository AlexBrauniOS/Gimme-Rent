//
//  AllRequestsTableViewCell.swift
//  Gimme Rent
//
//  Created by Oleksiy Lubarets on 01.06.17.
//  Copyright © 2017 Alex Braun. All rights reserved.
//

import UIKit
import Parse

class AllRequestsTableViewCell: UITableViewCell {

    @IBOutlet weak var PhotoAllRequest: UIImageView!
    @IBOutlet weak var DateFromAllRequest: UILabel!
    @IBOutlet weak var DateToAllRequest: UILabel!
    @IBOutlet weak var PeopleAllRequest: UILabel!
    @IBOutlet weak var PriceAllRequest: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
