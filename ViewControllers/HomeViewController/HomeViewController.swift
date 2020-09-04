//
//  HomeViewController.swift
//  CustomLoginDemo
//
//  Created by Christopher Ching on 2019-07-22.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
   
    @IBOutlet var HomeButton: UIButton!
//    @IBOutlet var HelloText: UILabel
    @IBOutlet var NumberSchLabel: UIStackView!
    @IBOutlet var ScheduleButton: UIButton!
    // email updated from the previous view via segage
    @IBOutlet var SchdlsButton: UIButton!
    @IBOutlet var AccountButton: UIButton!
    var sai=""
    var uid=""
    let users=Auth.auth().currentUser!
    
//    var ref: DatabaseReference!
     let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        ref = Database.database().reference()
//      let cnst = "rIpLwRakl5EfkLvAISpu"
//        self.ref.child("users").child().setValue("AnanyaaaaaaaaPapa")
        
        // this is the main email that has to be done
      
//        let db = Firestore.firestore()
//        let coll = db.collection("users")
//        coll.document().updateData([
//            "Email": "updated@gmail.com"
//        ]) { err in
//            if let err = err {
//                print("Error updating document: \(err)")
//            } else {
//                print("Document successfully updated")
//            }
//        }
//          db.collection("users").addDocument(data: ["First Name":firstName, "Last Name":lastName,"Email":email])
      
        // Do any additional setup after loading the view.
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
