//
//  AvailabilityViewController.swift
//  Boneapp
//
//  Created by Sai Teja on 07/03/20.
//  Copyright © 2020 Boneapp. All rights reserved.
//

import UIKit
import Firebase
class AvailabilityViewController: UIViewController {
    var db : DatabaseReference!
    let user = Auth.auth().currentUser!
   
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var AvailabilitySwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Database.database().reference()
        db.child("users").child(self.user.uid as! String).setValue(["avail" : true]) { (err : Error?, db :
            DatabaseReference) in
            if let err = err{
                print("Data could not be saved properly \(err)")
            }
            else {
                print("data is saved properly")
            }
        }
    
        if AvailabilitySwitch.isOn == true
        {
            
        }        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
