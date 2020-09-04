//
//  NameEditViewController.swift
//  Boneapp
//
//  Created by SAI TEJA on 5/19/20.
//  Copyright © 2020 Boneapp. All rights reserved.
//

import UIKit
import Firebase
class NameEditViewController: UIViewController {

    @IBOutlet weak var NameEdit: UITextField!
    @IBOutlet weak var NameEditDone: UIButton!
    @IBOutlet weak var Error: UILabel!
    var AcntVC:AccountViewController?
   
    func updateFireData(from : String? , to : String?){
        let users = Auth.auth().currentUser!
        let uid :String = users.uid
        print("uid is \(uid)")
        let db = Firestore.firestore()
        db.collection("users").document(uid).updateData([from!: to!])
        
    }
    
    @IBAction func NameEditDoneAction(_ sender: Any) {
        print("enter\n")
        if NameEdit.text!.isEmpty != true {
            Error.text = ""
        updateFireData(from: "firstname", to: NameEdit.text!)
            print(NameEdit.text!)
            performSegue(withIdentifier: "NameEditDoneToVC", sender: nil)
        }
        else {
            Error.text = "Please Enter a Name to change or go back"
        }
       
//    performSegue(withIdentifier: "NameEditDoneToVC", sender: nil)
//       self.dismiss(animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
