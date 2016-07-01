//
//  DisplayDebtViewController.swift
//  Borrower
//
//  Created by Harrison Woodward on 6/30/16.
//  Copyright © 2016 Harrison Woodward. All rights reserved.
//

import UIKit
import RealmSwift


class DisplayDebtViewController: UIViewController {

    @IBOutlet weak var whoTextField: UITextField!
    @IBOutlet weak var whatTextField: UITextField!
  
    @IBOutlet weak var currentDateTextField: UITextField!
    @IBOutlet weak var returnDatePicker: UIDatePicker!
    
  
    var debt: Debt?
    
    
    
    
    override func viewDidLoad() {
       
        
       
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let debt = debt {
            whoTextField.text = debt.name
            whatTextField.text = debt.what
        } else {
        whoTextField.text = ""
        whatTextField.text = ""
        }
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .NoStyle
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        
        currentDateTextField.text = dateFormatter.stringFromDate(NSDate())
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let iOUTableViewController = segue.destinationViewController as! IOUTableViewController
        if let identifier = segue.identifier {
            if identifier == "cancelDebt" {
                print("Cancelling debt")
            } else if identifier == "saveDebt"{
                print("Saving debt")
                
                if let debt = debt {
                    
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateStyle = .MediumStyle
                    dateFormatter.timeStyle = .NoStyle
                    
                    dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
                    
                    let newDebt = Debt()
                    newDebt.name = whoTextField.text ?? ""
                    newDebt.what = whatTextField.text ?? ""
                    newDebt.returnDate = dateFormatter.stringFromDate(returnDatePicker.date)
                    
                    RealmHelper.updateDebt(debt, newDebt: newDebt)
                    
                }
                else {
                
                let debt = Debt()
                
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateStyle = .MediumStyle
                dateFormatter.timeStyle = .NoStyle
                
                dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
                
                debt.name = whoTextField.text ?? ""
                debt.what = whatTextField.text ?? ""
                debt.currentDate = currentDateTextField.text!
                
                debt.returnDate = dateFormatter.stringFromDate(returnDatePicker.date)
                RealmHelper.addDebt(debt)
                
              }
                iOUTableViewController.debts = RealmHelper.retrieveDebts()
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
