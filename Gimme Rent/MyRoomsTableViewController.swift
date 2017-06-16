//
//  MyRoomsTableViewController.swift
//  Gimme Rent
//
//  Created by Oleksiy Lubarets on 01.06.17.
//  Copyright © 2017 Alex Braun. All rights reserved.
//

import UIKit
import Parse

class MyRoomsTableViewController: UITableViewController, SaveNewRoom {

    @IBOutlet var myRoomsTableView: UITableView!
    
    var newRoom: [NewRoom] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddNewRoomViewController" {
            if let controller = segue.destination as? AddNewRoomViewController {
                
                controller.delegateNewRoom = self
            }
        }

        //        else if segue.identifier == "MyOffersTableViewController" {
        //
        //             if controller = segue.destination as? MyOffersTableViewController,
        //                let requestModel = sender as? NewRequest {
        //
        //                                controller.request = requestModel
        //            }
        //        }

        
    }
    

    func saveNewRoom(_ room: NewRoom) {
        newRoom.append(room)
        myRoomsTableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newRoom.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTableViewCell", for: indexPath) as! RoomTableViewCell

        let room = newRoom[indexPath.row]
        cell.AdressInMyRoomsCellLabel.text = (room.city + ", " + room.adress)
        cell.SeatsInMyRoomsCellLabel.text = String(room.seats)
        cell.PriceInMyRoomsCellLabel.text = String(room.price)
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            newRoom.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
//        else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
