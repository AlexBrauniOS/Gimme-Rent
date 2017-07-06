//
//  RequestsTableTableViewController.swift
//  Gimme Rent
//
//  Created by Oleksiy Lubarets on 18.05.17.
//  Copyright © 2017 Alex Braun. All rights reserved.
//

import UIKit
import Parse

class RequestsTableViewController: UITableViewController, SaveDelegat {

    @IBOutlet var requestsTableView: UITableView!
    
    var newRequest: [NewRequest] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loginCheck(user: PFUser.current())
    }
    
    func loginCheck(user: PFUser?) {
        if PFUser.current() == nil {
            let loginSB = UIStoryboard(name: "LoginStoryboard", bundle: nil)
            
            let loginVC = loginSB.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(loginVC, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddRequestTableViewController" {
            if let controller = segue.destination as? AddRequestTableViewController {
                
                controller.delegate = self
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
    
    func saveRequest(_ request: NewRequest) {
        newRequest.append(request)
        requestsTableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newRequest.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestTableViewCell") as! RequestTableViewCell
        
        let request = newRequest[indexPath.row]
        
        cell.CityOfRequest.text = request.city
        cell.DateFrom.text = request.periodFrom
        cell.DateTo.text = request.periodTo
        
        cell.layer.cornerRadius = 20
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let request = newRequest[indexPath.row]
        
//        performSegue(withIdentifier: "MyOffersTableViewController", sender: request)
    }
    
    
    // DELETE
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            newRequest.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


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


