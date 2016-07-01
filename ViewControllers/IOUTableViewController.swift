//
//  IOUTableViewController.swift
//  Borrower
//
//  Created by Harrison Woodward on 6/30/16.
//  Copyright © 2016 Harrison Woodward. All rights reserved.
//

import UIKit
import RealmSwift

class IOUTableViewController: UITableViewController {
    
    var debts : Results<Debt>! {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        debts = RealmHelper.retrieveDebts()

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }



    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return debts.count
    }
    
    @IBAction func unwindToIOUViewController(segue: UIStoryboardSegue) {

    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            RealmHelper.deleteDebt(debts[indexPath.row])
            debts = RealmHelper.retrieveDebts()
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IOUCell", forIndexPath: indexPath) as! IOUTableViewCell
        let row = indexPath.row
        let debt = debts[row]
        
        cell.nameLabel.text = debt.name
        cell.whatLabel.text = debt.what
        cell.dateLabel.text = debt.returnDate
        
        
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier{
            if identifier == "displayDebt" {
                print("Displaying a debt")
                
                let indexPath = tableView.indexPathForSelectedRow!
                let debt = debts[indexPath.row]
                let iOUTableViewController = segue.destinationViewController as! DisplayDebtViewController
                iOUTableViewController.debt = debt
                
            } else if identifier == "addDebt" {
                print("Add a debt")
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
