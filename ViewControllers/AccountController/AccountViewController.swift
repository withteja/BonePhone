//
//  AccountViewController.swift
//  Boneapp
//
//  Created by SAI TEJA on 5/17/20.
//  Copyright © 2020 Boneapp. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AccountViewController: UIViewController {
    
    @IBOutlet weak var Photo: UIImageView!
    
    @IBOutlet weak var FirstName: UILabel!
    
    @IBOutlet weak var FirstNameEdit: UIButton!
    
    
    @IBOutlet weak var LastName: UILabel!
    
    @IBOutlet weak var LastNameEdit: UIButton!
    
    @IBOutlet weak var Phone: UILabel!
    @IBOutlet weak var PhoneEdit: UIButton!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var EmailEdit: UIButton!
    @IBOutlet weak var Position: UILabel!
    @IBOutlet weak var PositionEdit: UIButton!
    let users=Auth.auth().currentUser!
    
    func GetBackText(data:String?){
        print("\nData is: \(data)")
        FirstName.text = data
        self.viewDidLoad()
        self.viewWillAppear(true)
    }
    @IBAction func NameEditAction(_ sender: Any) {
        
        
        
    }
    func success(){
        print("success")
    }
    func failure()
    {
        print("failure")
    }
    var refresh = UIRefreshControl()
    func setFireData(from: String?,to : UILabel)
    {
        // checking if the text is not equal to nil
        if to.text?.isEmpty == false {
            let users=Auth.auth().currentUser!
            let uid : String = users.uid
            let db = Firestore.firestore()
            db.collection("users").whereField("uid", isEqualTo:uid).getDocuments { (snapshot, error) in
                
                for document in snapshot!.documents
                {
                    // accessing the "users" [String? : Any?]
                    let DocData  =  document.data()
                    // as? String will cast from any to String
                    self.refresh.beginRefreshing()
                    to.text = DocData[from!] as? String
                    self.refresh.endRefreshing()
                    print("\(String(describing: to.text))\n")
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        //        let uid : String = users.uid
        super.viewDidLoad()
        // database reference
        //        let db = Firestore.firestore()
        //
        //        db.collection("users").whereField("uid", isEqualTo:uid).getDocuments { (snapshot, error) in
        //
        //            for document in snapshot!.documents {
        //                // accessing the "users" [String? : Any?]
        //                let DocData  =  document.data()
        //                // as? String will cast from any to String
        //                self.FirstName.text = DocData["firstname"] as? String
        //                print("\(String(describing: self.FirstName.text))\n")
        //
        //            }
        //
        //        }
        
        setFireData(from: "firstname",to: FirstName)
        setFireData(from: "lastname",to: LastName)
        setFireData(from: "email",to: Email)
        setFireData(from: "phone", to: Phone)
        setFireData(from: "position", to: Position)
        
        
        
        
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
